import 'package:archive_app/view/widgets.dart';
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
              Widgets.text(namesurname, size: 20,bold: true, padding: 2),
              Widgets.text(tc.toString(), size: 15, padding: 2),
              Widgets.text(accessAuth, size: 20, padding: 2),
              Wrap(
                children: [
                  Widgets.button(Icons.add, "Belge Ekle", () {}),
                  Widgets.button(Icons.list, "Belgeleri Listele", () {}),
                ],
              ),
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
