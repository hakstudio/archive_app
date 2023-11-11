import 'package:archive_app/model/access_auth.dart';
import 'package:archive_app/model/document_item.dart';
import 'package:archive_app/model/user.dart';
import 'package:archive_app/viewmodel/convert_vm.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter/services.dart';

class Widgets {
  static Widget text(String text,
      {double size = 15,
      bool bold = false,
      double padding = 8.0,
      TextAlign textAlign = TextAlign.center}) {
    var fontWeight = bold ? FontWeight.bold : FontWeight.normal;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
        textAlign: textAlign,
      ),
    );
  }

  static Widget button(IconData icon, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Widgets.text(text, size: 20)
          ],
        ),
      ),
    );
  }

  static Widget sizedbox(double height) {
    return SizedBox(height: height);
  }

  static Widget textField(TextEditingController controller, String hint,
      {bool obscureText = false,
      ValueChanged<String>? onChanged,
      int? maxLength,
      TextInputType textInputType = TextInputType.none,
      bool typeIsNum = false}) {
    List<TextInputFormatter>? tifList = [];
    if (typeIsNum) {
      tifList.add(FilteringTextInputFormatter.digitsOnly);
      textInputType = TextInputType.number;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          maxLength: maxLength,
          obscureText: obscureText,
          keyboardType: textInputType,
          inputFormatters: tifList,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: hint,
          ),
        ),
      ),
    );
  }

  static Widget dropDown(
      List<String> list, String value, ValueChanged onChanged,
      {String text = "", double textSize = 20}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Widgets.text(text, size: textSize),
          DropdownButton(
              value: value,
              items: list.map<DropdownMenuItem<String>>(
                (e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                },
              ).toList(),
              onChanged: onChanged),
        ],
      ),
    );
  }

  static Widget checkBox(
      String text, bool value, ValueChanged<bool?> onChanged) {
    return Container(
      width: 200,
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Widgets.text(text, size: 20),
      ),
    );
  }

  static Widget dateTimeField(String hint, TextEditingController controller) {
    DateTime d = DateTime.now();
    return textField(
      controller,
      "$hint(${ConvertVM.dateToString(d)})",
      maxLength: 16,
      onChanged: (value) {
        RegExp doubleSym = RegExp(r'//|:/|/:');
        if (doubleSym.hasMatch(value)) value = value.replaceAll(doubleSym, '/');

        RegExp trueText = RegExp(r'^[\d/:]+');
        if (trueText.hasMatch(value)) value = trueText.stringMatch(value)!;

        controller.text = value;
        checkDateTimeField(controller.text, controller);

        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length));
      },
    );
  }

  static void checkDateTimeField(var value, var controller) {
    bool lastIsNum = true;
    try {
      int.parse(value.substring(value.length - 1));
    } catch (e) {
      lastIsNum = false;
    }

    if (lastIsNum) {
      switch (value.length) {
        case 2:
          controller.text += "/";
          break;
        case 5:
          controller.text += "/";
          break;
        case 10:
          controller.text += "/";
          break;
        case 13:
          controller.text += ":";
          break;
      }
    }
  }

  static Widget bigIcon(IconData icon) {
    return Icon(
      icon,
      size: 100,
    );
  }

  static Widget listDocListView(List<DocumentItem> documentItemList) {
    return SizedBox(
      width: 300,
      child: Expanded(
        child: ListView.builder(
          itemCount: documentItemList.length,
          itemBuilder: (context, index) {
            DocumentItem item = documentItemList[index];
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Widgets.text("Belge ID"),
                            Widgets.text("Belge Adı"),
                            Widgets.text("Erişim Yetkisi"),
                            Widgets.text("Tarih"),
                            Widgets.text("Yükleyen"),
                            Widgets.text("Yükleyen TC"),
                            Widgets.text("Son Düzenleyen"),
                            Widgets.text("Son Düzenleyen TC"),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Widgets.text(item.docId.toString(), bold: true),
                            Widgets.text(item.docName),
                            Widgets.text(item.accessAuth.toString()),
                            Widgets.text(ConvertVM.dateToString(item.date)),
                            Widgets.text(item.uploadedBy),
                            Widgets.text(item.uploadedByTc.toString()),
                            Widgets.text(item.edittedBy),
                            Widgets.text(item.edittedByTc.toString()),
                          ]),
                    ],
                  ),
                  Widgets.button(Icons.picture_as_pdf, "Dosyayı Aç", () {
                    html.window.open(item.docUrl, item.docName);
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget accessAuthListView(List<AccessAuth> accessAuthList) {
    return Expanded(
      child: SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: accessAuthList.length,
          itemBuilder: (context, index) {
            AccessAuth accessAuth = accessAuthList[index];
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Widgets.text("Erişim Yetkisi"),
                          Widgets.text("Erişim Yetkisi Adı"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Widgets.text(accessAuth.accessAuth.toString()),
                          Widgets.text(accessAuth.accessAuthName),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget userListView(List<User> userList) {
    return Expanded(
      child: SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            User user = userList[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Widgets.text("TC Kimlik Numarası"),
                            Widgets.text("Adı"),
                            Widgets.text("Soyadı"),
                            Widgets.text("Erişim Yetkisi"),
                            Widgets.text("Oluşturan"),
                            Widgets.text("Oluşturan TC"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Widgets.text(user.tc.toString()),
                            Widgets.text(user.name),
                            Widgets.text(user.surname),
                            Widgets.text(user.accessAuth.toString()),
                            Widgets.text(user.createdBy),
                            Widgets.text(user.createdByTc.toString()),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
