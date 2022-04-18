import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:qrcodereader/main.dart';
import 'package:qrcodereader/src/components/buttons.dart';
import 'package:qrcodereader/src/components/template.dart';
import 'package:qrcodereader/src/pages/qrcode.dart';
import 'package:qrcodereader/src/utils/colors.dart';
import 'package:qrcodereader/src/utils/routes.dart';
import 'package:qrcodereader/src/utils/strings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Strings strings = Strings();
  Routes routes = Routes();
  List<String> userList = [
    'LINHA 1',
    'LINHA 2',
    'LINHA 3',
    'LINHA 4',
    'LINHA 5',
    'LINHA 6'
  ];
  @override
  Widget build(BuildContext context) {
    String linha = storage.read('linha') ?? '';
    return Template([
      Text(strings.title_home,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: mainColor),
          child: TextButton(
              onPressed: () async {
                await FilterListDelegate.show<String>(
                  enableOnlySingleSelection: true,
                  context: context,
                  list: userList,
                  onItemSearch: (user, query) {
                    return user.toLowerCase().contains(query.toLowerCase());
                  },
                  tileLabel: (user) => user,
                  emptySearchChild: Center(child: Text(strings.not_found)),
                  searchFieldHint: strings.search,
                  onApplyButtonClick: (item) {
                    setState(() {
                      storage.write('linha', item!.first);
                    });
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  strings.description_home,
                  style: TextStyle(color: white),
                ),
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Visibility(
            child: Column(
              children: [
                Text(
                  '\nLINHA SELECIONADA :  ' + linha,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                PrimaryButton(strings.button_home, () {
                  routes.constructed(context, QRCodePage(linha));
                })
              ],
            ),
            visible: storage.read('linha') != null),
      ),
    ]);
  }
}
