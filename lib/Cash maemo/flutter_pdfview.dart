import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
class FlutterPDF extends StatefulWidget {
  const FlutterPDF({super.key, required this.path});
final String path;

  @override
  State<FlutterPDF> createState() => _FlutterPDFState();
}

class _FlutterPDFState extends State<FlutterPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter PDF")),
body: PDFView(
filePath: widget.path ,

),
    );
  }
}
