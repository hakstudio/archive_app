import 'package:archive_app/model/user.dart';
import 'package:archive_app/view/widgets.dart';
import 'package:archive_app/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';

class ListUsersView extends StatefulWidget {
  const ListUsersView({super.key});

  @override
  State<ListUsersView> createState() => _ListUsersViewState();
}

class _ListUsersViewState extends State<ListUsersView> {
  List<User> userList = [];
  UserVM userVM = UserVM();

  @override
  void initState() {
    super.initState();
    // userList.add(User(tc: 11111111,name: "Ahmet",surname: "DAL",accessAuth: 1,hideCreator: false,createdBy: "HAK",createdByTc: 101010));
    // userList.add(User(tc: 22222222,name: "Kahraman",surname: "DEMİR",accessAuth: 2,hideCreator: false,createdBy: "HAK",createdByTc: 101010));
    // userList.add(User(tc: 33333333,name: "Semih",surname: "SEVEN",accessAuth: 3,hideCreator: false,createdBy: "HAK",createdByTc: 101010));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Widgets.text("Kullanıcı Listesi", size: 30, bold: true),
            FutureBuilder(
              future: userVM.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Widgets.userListView(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Widgets.text(
                      "Hata, lütfen daha sonra tekrar deneyiniz.\n${snapshot.error}",
                      size: 30,
                      bold: true);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
