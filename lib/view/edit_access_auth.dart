import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:flutter/material.dart';

class EditAccessAuth extends StatefulWidget {
  EditAccessAuth({super.key});

  @override
  State<EditAccessAuth> createState() => _EditAccessAuthState();
}

class _EditAccessAuthState extends State<EditAccessAuth> {
  String accessAuthValue = "";
  final accessAuthNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    accessAuthValue = AccessAuth.get().first.toString();
  }

  @override
  Widget build(BuildContext context) {
    List<AccessAuth> accessAuthList=[];
    accessAuthList.add(AccessAuth(accessAuth: 1,accessAuthName: "Yönetici"));
    accessAuthList.add(AccessAuth(accessAuth: 2,accessAuthName: "Belediye Başkanı"));
    accessAuthList.add(AccessAuth(accessAuth: 3,accessAuthName: "Memur"));

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Widgets.bigIcon(Icons.accessibility),
            Widgets.dropDown(AccessAuth.get().map((e) => e.toString()).toList(),
                accessAuthValue, (value) {
              setState(() {
                accessAuthValue = value;
              });
            }, text: "Erişim Yetkisi"),
            Widgets.textField(accessAuthNameController, "Erişim Yetkisi Adı"),
            Widgets.button(Icons.save, "Kaydet", () { }),
            Widgets.text("Yetki Listesi",size: 20,bold: true),
            Widgets.accessAuthListView(accessAuthList),
          ],
        ),
      ),
    );
  }
}
