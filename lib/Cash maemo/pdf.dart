  import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
 import 'dart:io';


Future<void> createAndSaveSalePDF()async{
  final pdf=pw.Document();
  pdf.addPage(
      pw.MultiPage(
        margin: pw.EdgeInsets.zero,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
            child: pw.Column(
                children: [
                  pw.Text("header1: fahad header"),
                  pw.Text("header2:sami header"),
                ]
            )
          );
        },
        footer: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Row(
              children: [
                pw. Text("footer1: fahad Footer "),
                pw. Text("footer2: sami Footer "),
              ]
            )
          ]
        );
        },

        build: (pw.Context context) => <pw.Widget>[
          pw.Column(
            children: [
              pw.Text("build1: fahad build"),
              pw.Text("build2: sami build"),
            ]
          )
        ],
      )
  );
  // final output=await getTemporaryDirectory();
  // final file = File('${output.path}/pdf.pdf');
  // await file.writeAsBytes(await pdf.save());

if(Platform.isIOS){
  EasyLoading.show(status: "Generating PDF..");
  final dir=await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/pdf.pdf');
  final byteData =await pdf.save();
try{
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes));
}on FileSystemException catch(error){
  EasyLoading.showError(error.message);
  print(error.message);
}
}
  if(Platform.isAndroid){
    EasyLoading.show(status: "Generating PDF..");
    const _downloadFolderPath="/storage/emulated/0/Download/";
    Directory dir=Directory(_downloadFolderPath);
    final file = File('${dir.path}/pdf.pdf');
    final byteData =await pdf.save();

    try{
      await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes));
      EasyLoading.showSuccess("Create Success Ful Done\n/storage/emulated/0/Download/");
    }on FileSystemException catch(error){
      EasyLoading.showError(error.message);
      print(error.message);
    }
  }

}