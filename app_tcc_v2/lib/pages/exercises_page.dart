// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'package:app_tcc/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  Widget buildExerciseList() {
    final _ExercisePageState state = _ExercisePageState();
    return state.buildExerciseList();
  }

  Widget buildPdfView() {
    final _ExercisePageState state = _ExercisePageState();
    return state.buildPdfView();
  }

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<dynamic> exercises = [];
  bool showPdf = false;
  String? pdfPath;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await ApiUtils.fetchData('exercises');
      setState(() {
        exercises =
            response; // Atualiza a lista de exercícios com os dados retornados da API
      });
    } catch (e) {
      print('Erro na solicitação: $e');
    }
  }

  Future<void> downloadPdf(String base64String, String fileName) async {
    final bytes = base64.decode(base64String);
    final directory = await getApplicationDocumentsDirectory();
    pdfPath = '${directory.path}/$fileName.pdf';
    File(pdfPath!).writeAsBytesSync(bytes);
    print('Arquivo PDF salvo em: $pdfPath');

    // Agora você pode exibir o visualizador de PDF ou fazer qualquer outra operação necessária com o arquivo
    setState(() {
      showPdf = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFF8C00),
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFFFF8C00),
              size: 30,
            ),
            onPressed: fetchDataFromApi,
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, bottom: 40),
                child: Text(
                  'Exercícios',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Graphik',
                  ),
                ),
              ),
            ),
            Expanded(
              child: showPdf ? buildPdfView() : buildExerciseList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPdfView() {
    if (pdfPath != null) {
      return Stack(
        children: [
          PDFView(
            filePath: pdfPath!,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFFF8C00),
              ),
              onPressed: () {
                setState(() {
                  showPdf = false;
                });
              },
            ),
          ),
        ],
      );
    } else {
      // Retorne um widget vazio ou uma indicação de que o PDF não está disponível
      return AlertDialog(
        title: const Text('Erro de Visualização'),
        content: const Text(
            'O PDF não pôde ser exibido. Por favor, tente novamente'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar'),
          ),
        ],
      );
    }
  }

  Widget buildExerciseList() {
    return Column(
      children: exercises.map((exercise) {
        final exerciseFileName = exercise['nomeEx'];
        final exerciseFileData = exercise['pdfEx'];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
                          onPressed: () {
                            downloadPdf(exerciseFileData, exerciseFileName);
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
      }).toList(),
    );
  }
}
