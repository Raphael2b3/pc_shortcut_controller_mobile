import 'package:flutter/material.dart';
import 'package:pc_shortcut_controller_mobile/constants/styles.dart';

class DefaultTextField extends StatefulWidget {
  final String hintText;
  final String defaultText;
  final void Function(String value) onChange;

  const DefaultTextField({
    super.key,
    required this.hintText,
    required this.onChange,
    this.defaultText = "",
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.defaultText);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
            color: AppColors.mittelgrund,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: TextField(
          onChanged: (val) {
            setState(() {});
            widget.onChange(val);
          },
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyles.small,
          decoration: InputDecoration(
              hintStyle: TextStyles.hintText,
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.only(left: 13),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
          cursorColor: AppColors.highattention,
        ),
      ),
    );
  }
}
