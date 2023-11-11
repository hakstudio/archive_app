import 'package:archive_app/view/widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Widgets.sizedbox(50),
              Widgets.bigIcon(Icons.lock),
              Widgets.sizedbox(50),
              Widgets.textField(usernameController, "Kullanıcı Adı"),
              Widgets.sizedbox(25),
              Widgets.textField(passwordController, "Şifre", obscureText: true),
              Widgets.sizedbox(25),
              Widgets.button(
                Icons.login,
                "Giriş Yap",
                () {
                  String username = usernameController.value.text;
                  String password = passwordController.value.text;

                  if (username.isNotEmpty && password.isNotEmpty) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
