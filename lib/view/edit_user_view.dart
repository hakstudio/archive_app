import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/model/user.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:archive_app/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:archive_app/viewmodel/convert_vm.dart';

class EditUserView extends StatefulWidget {
  User? user;

  EditUserView({super.key, this.user}) {}

  @override
  State<EditUserView> createState() => _EditUserViewState(user: user);
}

class _EditUserViewState extends State<EditUserView> {
  int userId = -1;
  String userIdStr = "";
  final tcController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  bool hideCreator = false;
  String createdBy = "";
  int createdByTc = -1;

  String accessAuthValue = "";

  UserVM userVM = UserVM();
  User? user = null;

  _EditUserViewState({this.user});

  @override
  void initState() {
    super.initState();
    accessAuthValue = AccessAuth.get().first.toString();
    if (user != null) {
      userId = user?.id ?? -1;
      tcController.text = user?.tc.toString() ?? "-1";
      nameController.text = user?.name ?? "";
      surnameController.text = user?.surname ?? "";
      hideCreator = user?.hideCreator ?? false;
      createdBy = user?.createdBy ?? "";
      createdByTc = user?.createdByTc ?? -1;
      int accessAuth = (user?.accessAuth ?? AccessAuth.get().first);
      accessAuthValue = accessAuth.toString();
    }
    userIdStr = userId == -1 ? "" : userId.toString();
  }

  bool noValue() {
    return tcController.text == "" ||
        nameController.text == "" ||
        surnameController.text == "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Widgets.bigIcon(Icons.person),
              Widgets.text("Kullanıcı ID\n$userIdStr", size: 25, bold: true),
              Widgets.textField(tcController, "TC Kimlik Numarası",
                  typeIsNum: true, maxLength: 11),
              Widgets.textField(nameController, "İsim"),
              Widgets.textField(surnameController, "Soyisim"),
              Widgets.dropDown(
                  AccessAuth.get().map((e) => e.toString()).toList(),
                  accessAuthValue, (value) {
                setState(() {
                  accessAuthValue = value;
                });
              }, text: "Erişim Yetkisi"),
              Widgets.checkBox("Oluşturanı Gizle", hideCreator, (value) {
                setState(() {
                  hideCreator = value!;
                });
              }),
              Wrap(
                children: [
                  Widgets.button(Icons.save, "Kaydet", () {
                    if (noValue()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Lütfen tüm bilgileri doldurun")));
                    } else if (user != null) {
                      userVM
                          .updateUser(
                              userId,
                              User(
                                  tc: int.parse(tcController.text),
                                  name: nameController.text,
                                  surname: surnameController.text,
                                  accessAuth: int.parse(accessAuthValue),
                                  hideCreator: hideCreator))
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: Text("Kullanıcı Güncellendi"))));
                    } else {
                      User userNew = User(
                          tc: int.tryParse(tcController.text),
                          name: nameController.text,
                          surname: surnameController.text,
                          accessAuth: int.tryParse(accessAuthValue),
                          hideCreator: hideCreator);
                      userVM.addUser(userNew).then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Kullanıcı Eklendi"))));
                      setState(() {
                        tcController.text = "";
                        nameController.text = "";
                        surnameController.text = "";
                        accessAuthValue = AccessAuth.get().first.toString();
                        hideCreator = false;
                      });
                    }
                  }),
                  Widgets.button(Icons.delete, "Sil", () {
                    if (user != null) {
                      userVM.deleteUser(userId).then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Kullanıcı Silindi"))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Silinecek Kullanıcı Yok")));
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
