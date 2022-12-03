import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

   final String? title;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(56);
  }
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title ?? ""),
    );
  }
}
