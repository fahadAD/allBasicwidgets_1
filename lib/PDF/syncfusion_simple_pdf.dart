import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
 class PDFscreen extends StatefulWidget {
  const PDFscreen({super.key, required this.pdfdetail, required this.pdfnamr});
final String pdfdetail;
final String pdfnamr;
  @override
  State<PDFscreen> createState() => _PDFscreenState();
}

class _PDFscreenState extends State<PDFscreen> {
  //  final pdfPinchController = PdfControllerPinch(
  //    document: PdfDocument.openAsset('assets/rusume1.pdf'),
  //  );
  //
  //
  //
  //
  // final pdfController = PdfController(
  // document: PdfDocument.openAsset('assets/rusume1.pdf'),
  // );
  //  //     PdfView(
  //  //     controller: pdfController,
  //  //   ),
  //  //
  //  //   PdfViewPinch(
  //  //   controller: pdfPinchController,
  //  // ),


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pdfnamr,)),
      // body: SfPdfViewer.asset("assets/rusume1.pdf"),
      // body: SfPdfViewer.asset("assets/pre.pdf"),
      body: SfPdfViewer.asset(
        widget.pdfdetail,
        scrollDirection: PdfScrollDirection.horizontal,
      ),
    );
  }
}
