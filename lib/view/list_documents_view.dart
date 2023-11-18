import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:archive_app/model/document.dart';

class ListDocumentsView extends StatefulWidget {
  ListDocumentsView({super.key});

  @override
  State<ListDocumentsView> createState() => _ListDocumentsViewState();
}

class _ListDocumentsViewState extends State<ListDocumentsView> {
  final searchInDocsController = TextEditingController();
  final docNameController = TextEditingController();
  final accessAuthController = TextEditingController();
  final startDateController = TextEditingController();
  final finishDateController = TextEditingController();
  final uploadedByNameOrTcController = TextEditingController();
  final editedByNameOrTcController = TextEditingController();

  List<Document> documentItemList = [];
  String erisimYetkisiValue = "";

  @override
  void initState() {
    super.initState();
    erisimYetkisiValue = AccessAuth.get().first.toString();
  }

  @override
  Widget build(BuildContext context) {
    Document item = Document();
    item.docId = 1;
    item.docName = "Doküman";
    item.accessAuth = 3;
    item.date = DateTime.now();
    item.uploadedBy = "HAK";
    item.uploadedByTc = 10101010;
    item.edittedBy = "HAK";
    item.edittedByTc = 10101010;
    item.docUrl =
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
    documentItemList.add(item);
    documentItemList.add(item);
    documentItemList.add(item);
    documentItemList.add(item);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Widgets.bigIcon(Icons.search),
                  Widgets.textField(searchInDocsController, "Belgelerde Ara"),
                  Wrap(
                    children: [
                      Widgets.textField(docNameController, "Belge Adı"),
                      Widgets.dropDown(
                          AccessAuth.get().map((e) => e.toString()).toList(),
                          erisimYetkisiValue, (value) {
                        setState(() {
                          erisimYetkisiValue = value;
                        });
                      }, text: "Erişim Yetkisi"),
                    ],
                  ),
                  Wrap(
                    children: [
                      Widgets.dateTimeField(
                          "Başlangıç Tarihi", startDateController),
                      Widgets.dateTimeField(
                          "Bitiş Tarihi", finishDateController),
                    ],
                  ),
                  Wrap(
                    children: [
                      Column(
                        children: [
                          Widgets.text("Dokümanı Yükleyenin",
                              size: 15, padding: 0),
                          Widgets.textField(
                              uploadedByNameOrTcController, "Adı veya TC'si"),
                        ],
                      ),
                      Column(
                        children: [
                          Widgets.text("Dokümanı Son Düzenleyenin",
                              size: 15, padding: 0),
                          Widgets.textField(
                              editedByNameOrTcController, "Adı veya TC'si"),
                        ],
                      ),
                    ],
                  ),
                  Widgets.button(Icons.search, "Belgeyi Ara", () {}),
                ],
              ),
            ),
            Widgets.listDocListView(documentItemList),
          ],
        ),
      ),
    );
  }
}
