import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/core/utils/size_config.dart';
import 'package:flutter_clean_arch/app/core/utils/themes/light_theme.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color splashColor;
  final double borderRadius;
  final double height;
  final double width;
  final Function() onTap;
  final Alignment alignment;
  final Widget child;
  final EdgeInsets padding;

  const ButtonWidget(
      {Key key,
      @required this.child,
      this.backgroundColor,
      this.foregroundColor,
      this.borderRadius,
      this.height,
      this.onTap,
      this.padding,
      this.width,
      this.alignment,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      color: Colors.transparent,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        color: backgroundColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: InkWell(
          splashColor: splashColor ?? MainTheme.splashColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          onTap: onTap,
          child: Container(
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 1.836659 * SizeConfig.heightMultiplier,
                  horizontal: 3.8197 * SizeConfig.widthMultiplier,
                ),
            height: height ?? 6.1222 * SizeConfig.heightMultiplier,
            width: width,
            alignment: alignment ?? Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
