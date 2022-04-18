import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:qrcodereader/src/components/template.dart';
import 'package:qrcodereader/src/utils/colors.dart';
import 'package:qrcodereader/src/utils/strings.dart';
import 'package:scan/scan.dart';

class QRCodePage extends StatefulWidget {
  String linha;
  QRCodePage(this.linha, {Key? key}) : super(key: key);
  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  Strings strings = Strings();
  ScanController _controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Template([
      Text(strings.linha + ': ${widget.linha}',
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: Text(strings.description_qrcode,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0)),
      ),
      Icon(LineIcons.camera, size: 64.0, color: black),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ScanView(
          controller: _controller,
          scanAreaScale: .7,
          scanLineColor: thirdColor,
          onCapture: (data) {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: secondColor,
                title: Text(strings.code_bar_title),
                content: Text(data),
              ),
            );
          },
        ),
      )
    ]);
  }
}
