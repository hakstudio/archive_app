import 'dart:typed_data';

import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditDocumentView extends StatefulWidget {
  EditDocumentView({super.key});

  @override
  State<EditDocumentView> createState() => _EditDocumentViewState();
}

class _EditDocumentViewState extends State<EditDocumentView> {
  String docID = "belge0001";
  String docName = "Belge 1";
  String pdfName = "";
  Uint8List? bytes = Uint8List.fromList([]);
  bool hideCreator = false;

  String accessAuthValue = "";

  TextEditingController docNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    accessAuthValue = AccessAuth.get().first.toString();
    docNameController.text = docName;
    pdfName = pdfName == "" ? "PDF Seçilmedi" : pdfName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Widgets.bigIcon(Icons.edit),
              Widgets.text(docID, size: 30, bold: true),
              Widgets.textField(docNameController, "Belge Adı"),
              Widgets.dropDown(
                  AccessAuth.get().map((e) => e.toString()).toList(),
                  accessAuthValue, (value) {
                setState(() {
                  accessAuthValue = value;
                });
              },text: "Erişim Yetkisi"),
              Widgets.button(Icons.picture_as_pdf, "Belge Seçin", () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    pdfName = file.name;
                    bytes = file.bytes;
                  });
                }
              }),
              Widgets.text(pdfName, size: 15, padding: 0),
              Widgets.checkBox("Beni Gizle", hideCreator, (value) {
                setState(() {
                  hideCreator = value!;
                });
              }),
              Wrap(
                children: [
                  Widgets.button(Icons.save, "Kaydet", () {}),
                  Widgets.button(Icons.delete, "Sil", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
