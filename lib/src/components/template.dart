import 'package:flutter/material.dart';
import 'package:qrcodereader/src/utils/colors.dart';
import 'package:qrcodereader/src/utils/strings.dart';

class Template extends StatelessWidget {
  List<Widget> widgets;
  Template(this.widgets, {Key? key}) : super(key: key);
  Strings strings = Strings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Text(
            strings.appBar_hello,
            style: const TextStyle(fontSize: 14.0),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: white),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: white,
            image: const DecorationImage(
              image: AssetImage('assets/airplane.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: widgets),
              ),
            ),
          ),
        ));
  }
}
