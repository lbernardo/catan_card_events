import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

confirmDialog(
  BuildContext context, {
  required String title,
  required String content,
  required void Function()? onPress,
  String textCancel = 'Cancelar',
  String textYes = 'Sim',
}) {
  // set up the buttons
  Widget cancelButton = OutlinedButton(
    child: Text(textCancel),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = OutlinedButton(
    child: Text(textYes),
    onPressed: onPress,
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
