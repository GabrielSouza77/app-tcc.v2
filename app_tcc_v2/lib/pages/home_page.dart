import 'dart:convert';
import 'dart:io';

import 'package:app_tcc/pages/pdf_viewer_page.dart';
import 'package:app_tcc/utils/api_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/components/leveling_test.dart';
import 'package:app_tcc/pages/exercises_page.dart';
import 'package:app_tcc/pages/start_of_test.dart';
import 'package:app_tcc/pages/support_page.dart';
import 'package:app_tcc/pages/video_lessons_page.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  final BuildContext context;

  const HomePage({Key? key, required this.context}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void navigateTo() {
    Navigator.push(
      widget.context,
      MaterialPageRoute(
        builder: (context) => InitialTestPage(
          context: context,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Realize a ação desejada com base no índice do item selecionado
    if (_currentIndex == 0) {
      // Ação para o primeiro item
    } else if (_currentIndex == 1) {
      Navigator.push(
        widget.context,
        MaterialPageRoute(builder: (context) => const VideoLessonsPage()),
      );
      // Ação para o segundo item
    } else if (_currentIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExercisePage(),
        ),
      );
      // Ação para o terceiro item
    } else if (_currentIndex == 3) {
      Navigator.push(
        widget.context,
        MaterialPageRoute(builder: (context) => const SupportPage()),
      );
      // Ação para o quarto item
    }
  }

  List<dynamic> exercises = [];
  bool isDataLoaded = false;
  bool showPdf = false;
  String? pdfPath;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      // Atualiza a altura máxima do buildExerciseList com base no scroll
    });
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await ApiUtils.fetchData('exercises');
      setState(() {
        exercises =
            response; // Atualiza a lista de exercícios com os dados retornados da API
      });

      isDataLoaded = true;
      print(exercises.length);
    } catch (e) {
      print('Erro na solicitação: $exercises');
    }
  }

  Future<void> downloadPdf(String base64String, String fileName) async {
    final bytes = base64.decode(base64String);
    final directory = await getApplicationDocumentsDirectory();
    pdfPath = '${directory.path}/$fileName.pdf';
    File(pdfPath!).writeAsBytesSync(bytes);
    print('Arquivo PDF salvo em: $pdfPath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: signUserOut,
              icon: const Icon(
                Icons.logout,
                color: Color(0xFFFF8C00),
                size: 40,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          LevelingTestButton(
            onTap: navigateTo,
          ),
          const SizedBox(height: 125),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Últimos exercícios',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Graphik',
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 4),
                child: IconButton(
                  onPressed: () {
                    fetchDataFromApi();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Color(0xFFFF8C00),
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 25),
                  isDataLoaded
                      ? buildExerciseList()
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.home_rounded,
                  size: 90,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 11),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.ondemand_video_outlined,
                  size: 60,
                  color: const Color(0xFFFF8C00).withOpacity(0.6),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.assignment,
                  size: 60,
                  color: const Color(0xFFFF8C00).withOpacity(0.6),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.library_books,
                  size: 60,
                  color: const Color(0xFFFF8C00).withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExerciseList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exerciseFileName = exercises[index]['nomeEx'];
        final exerciseFileData = exercises[index]['pdfEx'];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: const Color(0xFFFF8C00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          exerciseFileName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Graphik',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Transform.scale(
                        scale: 1.2,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            final BuildContext context = widget.context;
                            await downloadPdf(
                                exerciseFileData, exerciseFileName);
                            if (pdfPath != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PDFViewerPage(
                                    exerciseFileData: exerciseFileData,
                                    fileName: exerciseFileName,
                                    pdfPath: pdfPath,
                                  ),
                                ),
                              );
                            } else {
                              print('Erro ao fazer o download do pdf');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
