



import 'package:allbasicwidgets1/PDF/multi_image_to_pdf.dart';
import 'package:allbasicwidgets1/PDF/syncfusion_simple_pdf.dart';
import 'package:flutter/material.dart';
import '../Cash maemo/pdf.dart';
import 'single_imageToPdf.dart';



class PdfHome extends StatefulWidget {
  const PdfHome({super.key});

  @override
  State<PdfHome> createState() => _PdfHomeState();
}

class _PdfHomeState extends State<PdfHome> {



  // Future<void> createAndSaveSalePDF()async{
  //   final pdf=pw.Document();
  //   pdf.addPage(
  //       pw.MultiPage(
  //         margin: pw.EdgeInsets.zero,
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         header: (pw.Context context) {
  //           return pw.Container(
  //               child: pw.Column(
  //                   children: [
  //                     pw.Text("header1: fahad header"),
  //                     pw.Text("header2:sami header"),
  //                   ]
  //               )
  //           );
  //         },
  //         footer: (pw.Context context) {
  //           return pw.Column(
  //               children: [
  //                 pw.Row(
  //                     children: [
  //                       pw. Text("footer1: fahad Footer "),
  //                       pw. Text("footer2: sami Footer "),
  //                     ]
  //                 )
  //               ]
  //           );
  //         },
  //
  //         build: (pw.Context context) => <pw.Widget>[
  //           pw.Column(
  //               children: [
  //                 pw.Text("build1: fahad build"),
  //                 pw.Text("build2: sami build"),
  //               ]
  //           )
  //         ],
  //       )
  //   );
  //   // final output=await getTemporaryDirectory();
  //   // final file = File('${output.path}/pdf.pdf');
  //   // await file.writeAsBytes(await pdf.save());
  //
  //   if(Platform.isIOS){
  //     EasyLoading.show(status: "Generating PDF..");
  //     final dir=await getApplicationDocumentsDirectory();
  //     final file = File('${dir.path}/pdf.pdf');
  //     final byteData =await pdf.save();
  //     try{
  //       await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes));
  //     }on FileSystemException catch(error){
  //       EasyLoading.showError(error.message);
  //       print(error.message);
  //     }
  //   }
  //   if(Platform.isAndroid){
  //     EasyLoading.show(status: "Generating PDF..");
  //     const _downloadFolderPath="/storage/emulated/0/Download/";
  //     Directory dir=Directory(_downloadFolderPath);
  //     final file = File('${dir.path}/pdf.pdf');
  //     final byteData =await pdf.save();
  //
  //     try{
  //       await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes));
  //       EasyLoading.showSuccess("Create Success Ful Done\n/storage/emulated/0/Download/");
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterPDF(path: "${dir.path}/pdf.pdf",),));
  //     }on FileSystemException catch(error){
  //       EasyLoading.showError(error.message);
  //       print(error.message);
  //     }
  //   }
  //
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Home",),backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PDFscreen(pdfdetail: "assets/rusume1.pdf", pdfnamr: 'Resume ',),));
          }, child: Text("PDF 1")),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PDFscreen(pdfdetail: "assets/pre.pdf", pdfnamr: 'Presentation',),));

          }, child: Text("PDF 2")),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleImageToPDF(),));

          }, child: Text("Single image to Convert pdf")),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MultiImageToPDF(),));

              }, child: Text("Multi image to Convert pdf")),
          SizedBox(height: 10,),

          ElevatedButton(
              onPressed: () {
                createAndSaveSalePDF();
               }, child: Text("cv building PDF ")),
        ],
      ),
    );
  }
}
