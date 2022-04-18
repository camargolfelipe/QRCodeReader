import 'package:flutter/material.dart';
import 'package:qrcodereader/src/utils/colors.dart';
import 'package:qrcodereader/src/utils/strings.dart';

class PrimaryButton extends StatelessWidget {
  Function()? function;
  String label;
  PrimaryButton(this.label, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings strings = Strings();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: mainColor),
        child: TextButton(
            onPressed: function,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(color: white),
              ),
            )),
      ),
    );
  }
}
