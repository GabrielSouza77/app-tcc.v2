import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

// ignore: must_be_immutable
class PDFViewerPage extends StatefulWidget {
  String? pdfPath;
  final String exerciseFileData;

  PDFViewerPage(
      {required this.pdfPath,
      required this.exerciseFileData,
      required String fileName});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
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
          )),
      body: widget.pdfPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(filePath: widget.pdfPath!),
    );
  }
}
