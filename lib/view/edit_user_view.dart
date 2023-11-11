import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:archive_app/viewmodel/convert_vm.dart';

class EditUserView extends StatefulWidget {
  EditUserView({super.key});

  @override
  State<EditUserView> createState() => _EditUserViewState();
}

class _EditUserViewState extends State<EditUserView> {
  final tcController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  bool hideCreator = false;
  String createdBy = "";
  int createdByTc = -1;
  DateTime createdTime = DateTime(1970);
  String editedBy = "";
  int editedByTc = -1;
  DateTime editedTime = DateTime(1970);
  String createdByText = "";
  String editedByText = "";
  String erisimYetkisiValue = "";

  @override
  void initState() {
    super.initState();
    if (createdBy != "") createdByText += createdBy;
    if (createdByTc != -1) createdByText += "/" + createdByTc.toString();
    if (createdTime.year > 1970)
      createdByText += "\n" + ConvertVM.dateToString(createdTime);

    if (editedBy != "") editedByText += editedBy;
    if (editedByTc != -1) editedByText += "/" + editedByTc.toString();
    if (editedTime.year > 1970)
      editedByText += "\n" + ConvertVM.dateToString(editedTime);

    erisimYetkisiValue = AccessAuth.get().first.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Widgets.bigIcon(Icons.person),
              Widgets.textField(tcController, "TC Kimlik Numarası",
                  typeIsNum: true, maxLength: 11),
              Widgets.textField(nameController, "İsim"),
              Widgets.textField(surnameController, "Soyisim"),
              Widgets.dropDown(
                  AccessAuth.get().map((e) => e.toString()).toList(),
                  erisimYetkisiValue, (value) {
                setState(() {
                  erisimYetkisiValue = value;
                });
              },text: "Erişim Yetkisi"),
              Widgets.checkBox("Beni Gizle", hideCreator, (value) {
                setState(() {
                  hideCreator = value!;
                });
              }),
              Widgets.text(createdByText),
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
