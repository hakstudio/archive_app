import 'package:archive_app/view/edit_document_view.dart';
import 'package:archive_app/view/edit_user_view.dart';
import 'package:archive_app/view/list_documents_view.dart';
import 'package:archive_app/view/list_users_view.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:archive_app/viewmodel/navigator_vm.dart';
import 'package:flutter/material.dart';

class ArchiveView extends StatelessWidget {
  ArchiveView({super.key});

  int tc = 81818181826;
  String namesurname = "Ahmet DAL";
  String accessAuth = "Yönetici(1)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              circleAvatar(),
              Widgets.text(namesurname, size: 20, bold: true, padding: 2),
              Widgets.text(tc.toString(), size: 15, padding: 2),
              Widgets.text(accessAuth, size: 20, padding: 2),
              Wrap(children: [
                Widgets.button(Icons.add, "Kullanıcı Ekle", () {
                  NavigatorVM.push(context, EditUserView());
                }),
                Widgets.button(Icons.add, "Belge Ekle", () {
                  NavigatorVM.push(context, EditDocumentView());
                }),
              ]),
              Wrap(children: [
                Widgets.button(Icons.list, "Kullanıcıları Listele", () {
                  NavigatorVM.push(context, ListUsersView());
                }),
                Widgets.button(Icons.list, "Belgeleri Listele", () {
                  NavigatorVM.push(context, ListDocumentsView());
                }),
              ]),
              Widgets.button(Icons.exit_to_app, "Çıkış Yap", () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleAvatar() {
    double size = 50;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: Icon(Icons.person, size: size + 20),
        radius: size,
      ),
    );
  }
}
