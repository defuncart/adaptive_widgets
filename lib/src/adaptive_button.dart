import 'package:adaptive_widgets/src/utils/device_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Button which is adaptive across iOS and Android.
/// 
/// On iOS a CupertinoButton is drawn, while RaisedButton on Android.
class AdaptiveButton extends StatelessWidget {
  /// Creates an adaptive button.
  const AdaptiveButton({
    Key key,
    @required this.child,
    this.padding,
    this.color,
    this.disabledColor,
    this.isFilledOniOS = true,
    @required this.onPressed,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Defaults to 16.0 pixels.
  final EdgeInsetsGeometry padding;

  /// The color of the button's background (iOS) or fill (Android).
  ///
  /// Ignored on iOS when `isFilledOniOS` is set to true - [CupertinoTheme]'s 
  /// `primaryColor` is used instead.
  ///
  /// On Android the default fill color is the theme's button color, [ThemeData.buttonColor].
  final Color color;

  /// The color of the button's background (iOS) or fill (Android) when the button is disabled.
  ///
  /// iOS: Ignored if the [CupertinoButton] doesn't also have a [color]. Defaults to a standard 
  /// iOS disabled color when [color] is specified and [disabledColor] is null.
  /// 
  /// Android: The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  final Color disabledColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback onPressed;

  /// iOS only: Whether the rendered CupertinoButton is filled or not.
  final bool isFilledOniOS;

  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return isFilledOniOS
          ? CupertinoButton.filled(
              child: child,
              padding: padding,
              disabledColor: disabledColor,
              onPressed: onPressed,
              key: key,
            )
          : CupertinoButton(
              child: child,
              padding: padding,
              color: color,
              disabledColor: disabledColor,
              onPressed: onPressed,
              key: key,
            );
    } else {
      return RaisedButton(
        child: child,
        padding: padding,
        color: color,
        disabledColor: disabledColor,
        onPressed: onPressed,
        key: key,
      );
    }
  }
}
