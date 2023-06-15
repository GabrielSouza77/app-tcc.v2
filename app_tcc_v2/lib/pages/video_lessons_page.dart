// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:app_tcc/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoLessonsPage extends StatefulWidget {
  const VideoLessonsPage({Key? key}) : super(key: key);

  @override
  _VideoLessonsPageState createState() => _VideoLessonsPageState();
}

class _VideoLessonsPageState extends State<VideoLessonsPage> {
  List<dynamic> videolessons = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await ApiUtils.fetchData('videolessons');
      setState(() {
        videolessons =
            response; // Atualiza a lista de exercícios com os dados retornados da API
      });
    } catch (e) {
      print('Erro na solicitação: $e');
    }
  }

  void openYoutubeLink(String? videoLink) {
    if (videoLink != null) {
      String videoId = YoutubePlayer.convertUrlToId(videoLink) ?? '';

      if (videoId.isNotEmpty) {
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
          ),
        );
      } else {
        throw 'Não foi possível obter o ID do vídeo do link $videoLink';
      }
    } else {
      throw 'O link do vídeo é nulo';
    }
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
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 40),
              child: Text(
                'Videoaulas',
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
            child: buildVideoList(),
          ),
        ],
      ),
    );
  }

  Widget buildVideoList() {
    return ListView.builder(
      itemCount: videolessons.length,
      itemBuilder: (context, index) {
        final videoslesson = videolessons[index];
        final videoslessonFileName = videoslesson['nomeVa'];
        final videoslessonFileData = videoslesson['linkVa'];

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
                      Icons.smart_display,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          videoslessonFileName,
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
                            Icons.open_in_new,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            openYoutubeLink(videoslessonFileData);
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
