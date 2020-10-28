import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_arch/app/core/utils/size_config.dart';
import 'package:flutter_clean_arch/app/core/utils/themes/light_theme.dart';

class TextFieldWidget extends StatelessWidget {
  @required
  final TextEditingController controller;
  @required
  final Function(String value) onChanged;
  @required
  final Function() onTap;
  // Non-required
  final Function() onSubmit;
  final double height;
  final double cursorWidth;
  final int maxLines;
  final String hint;
  final String initialValue;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Color borderColor;
  final bool autoFocus;
  final bool isObscure;
  final TextCapitalization textCapitalization;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextStyle fieldStyle;
  final TextInputType keyboardType;
  final EdgeInsets contentPadding;
  final EdgeInsets containerPadding;
  final TextAlign textAlignment;
  final TextAlignVertical textAlignmentVertical;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final List<TextInputFormatter> formatters;

  const TextFieldWidget(
      {Key key,
      this.hint,
      this.autoFocus,
      this.isObscure,
      this.textCapitalization,
      this.height,
      this.onChanged,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.labelStyle,
      this.hintStyle,
      this.fieldStyle,
      this.keyboardType,
      this.contentPadding,
      this.textAlignment,
      this.textAlignmentVertical,
      this.maxLines,
      this.cursorWidth,
      this.controller,
      this.formatters,
      this.onSubmit,
      this.initialValue,
      this.containerPadding,
      this.borderColor,
      this.focusedBorder,
      this.enabledBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Semantics(
        child: Center(
          child: Container(
            padding: containerPadding ?? EdgeInsets.symmetric(vertical: 0.3673319 * SizeConfig.heightMultiplier), // 3
            child: TextFormField(
              initialValue: initialValue,
              inputFormatters: formatters,
              cursorColor: Colors.black,
              maxLines: maxLines,
              autofocus: autoFocus ?? false,
              controller: controller,
              obscureText: isObscure ?? false,
              textAlign: textAlignment ?? TextAlign.justify,
              textAlignVertical: textAlignmentVertical,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              // style: fieldStyle ?? MainTheme.primaryFont.copyWith(letterSpacing: 0.1),
              keyboardType: keyboardType,
              onEditingComplete: onSubmit,
              decoration: InputDecoration(
                enabledBorder: enabledBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor ?? MainTheme.secondaryColor3,
                        width: 1,
                      ),
                    ),
                focusedBorder: focusedBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor ?? MainTheme.secondaryColor3,
                        width: 2,
                      ),
                    ),

                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                contentPadding: contentPadding,
                hintText: hint,
                hintStyle: hintStyle ??
                    TextStyle(color: Theme.of(context).hintColor, fontSize: 1.4693 * SizeConfig.heightMultiplier), //12
              ),
              cursorWidth: cursorWidth ?? 0.5,
              onChanged: onChanged,
              onTap: onTap ?? () {},
            ),
          ),
        ),
      ),
    );
  }
}
