import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class MySearchView extends StatefulWidget {
  const MySearchView({
    Key? key,
    this.labelText,
    this.onChanged,
    this.textController,
  }) : super(key: key);

  final String? labelText;
  final ValueSetter<String>? onChanged;
  final TextEditingController? textController;

  @override
  State<MySearchView> createState() => _MySearchViewState();
}

class _MySearchViewState extends State<MySearchView> {
  @override
  Widget build(BuildContext context) {
    var textController = widget.textController ?? TextEditingController();
    return TextField(
      controller: textController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(cornerImageCommon)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(cornerImageCommon)),
        prefixIcon: IconButton(
          onPressed: () {
            widget.onChanged?.call(textController.text);
          },
          icon: const Icon(Icons.search),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            textController.clear();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onChanged,
    );
  }
}

class TextBlack16 extends StatelessWidget {
  const TextBlack16({
    Key? key,
    this.text,
    this.maxLine = 1,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String? text;
  final int maxLine;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
      maxLines: maxLine,
    );
  }
}
