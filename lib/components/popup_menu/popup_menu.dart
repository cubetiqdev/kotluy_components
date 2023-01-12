import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CPopUpMenu extends StatelessWidget {
  void Function(String)? onSelected;
  List<String> popUpItem = <String>[];
  final Color? backGroudColor;
  TextStyle? textStyle;

  CPopUpMenu({
    super.key,
    this.onSelected,
    required this.popUpItem,
    this.backGroudColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: backGroudColor ?? Colors.white,
      onSelected: (value) {
        _onSelectedItem(value);
      },
      itemBuilder: (context) => [
        _popUpItem(
            title: "View",
            icon: Icons.file_open_outlined,
            index: Options.view.index),
        _popUpItem(
          title: "Edit",
          icon: Icons.edit,
          index: Options.edit.index,
        ),
        _popUpItem(
          title: "Delete",
          icon: Icons.delete,
          index: Options.delete.index,
        ),
      ],
    );
  }

  PopupMenuItem _popUpItem(
      {required String title, required IconData icon, required int index}) {
    return PopupMenuItem(
      value: index,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }

  _onSelectedItem(int value) {
    if (value == Options.view.index) {
      print("View");
    } else if (value == Options.edit.index) {
      print("Edit");
    } else {
      print("Delete");
    }
  }
}

enum Options { view, edit, delete }
