import 'package:archive_app/view/archive_view.dart';
import 'package:archive_app/view/edit_access_auth.dart';
import 'package:archive_app/view/edit_document_view.dart';
import 'package:archive_app/view/edit_user_view.dart';
import 'package:archive_app/view/list_documents_view.dart';
import 'package:archive_app/view/list_users_view.dart';
import 'package:archive_app/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
