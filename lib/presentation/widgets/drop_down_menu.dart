import 'package:flutter/material.dart';

import '../../logic/quiz_app_cubit.dart';
import 'text.dart';

class DropDownButtonCall extends StatelessWidget {
  const DropDownButtonCall({
    super.key,
    required this.items,
    this.padding = EdgeInsets.zero,
    required this.hint,
    required this.type,
    required this.onChanged,
  });

  final List items;
  final EdgeInsets padding;
  final String hint;
  final String type;
  final void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DropdownButtonFormField(
        isExpanded: true,
        alignment: Alignment.center,
        menuMaxHeight: 200,
        items: items
            .map(
              (item) => DropdownMenuItem(
                alignment: Alignment.center,
                value: item,
                child: TextCall(
                  text: item.name,
                  size: 16,
                  color: QuizAppCubit.get(context).textColor,
                ),
              ),
            )
            .toList(),
        dropdownColor: QuizAppCubit.get(context).backgroundColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: QuizAppCubit.get(context).appBarColor!,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: QuizAppCubit.get(context).appBarColor!,
              width: 2,
            ),
          ),
        ),
        hint: TextCall(
          text: hint,
          color: QuizAppCubit.get(context).textColor,
          size: 16,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
