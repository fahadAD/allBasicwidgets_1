import 'dart:io';
import 'package:allbasicwidgets1/PDF/pdf_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class MultiImageToPDF extends StatefulWidget {
  const MultiImageToPDF({super.key});

  @override
  State<MultiImageToPDF> createState() => _MultiImageToPDFState();
}

class _MultiImageToPDFState extends State<MultiImageToPDF> {
  final  picker=ImagePicker();
  final  pdf=pw.Document();
 List <File> _image=[];
  getImaggeFromGallery()async{
    final pickrdFile=await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pickrdFile != null){
        _image.add(File(pickrdFile.path,));
      }else{
        print("No Image Selected");
      }
    });

  }


  createPdf()async {
 for(var img in _image){
   final image = pw.MemoryImage(img.readAsBytesSync());
   pdf.addPage(pw.Page( pageFormat: PdfPageFormat.a4,build: (pw.Context context) {
     return pw.Center(child: pw.Image(image),);
   },));
 }
  }

  savePdf()async{
    try {
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/imagetoconvert.pdf');
      await file.writeAsBytes(await pdf.save());
      EasyLoading.showSuccess("Success Save To Document  Check this internal storage android folder");
      EasyLoading.showToast("Success Save To Document  Check this internal storage android folder");
      Navigator.push(context, MaterialPageRoute(builder: (context) => PdfHome(),));
    } catch (e) {
      print('error');
      EasyLoading.showError("Save Failed ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Multi  Image to pdf"),
            actions: [
              IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                tooltip: 'Add',
                onPressed: () {
                  createPdf();
                  savePdf();
                },
              ),
            ]),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getImaggeFromGallery();
          },child: Text("Add"),),

        body: _image!=null?ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _image.length,
          itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              width: double.infinity,

              child: Image.file(_image[index],fit: BoxFit.fill,),),
          );
        },

        ):Center(child: Text("Upload Image"))

    );

  }

}