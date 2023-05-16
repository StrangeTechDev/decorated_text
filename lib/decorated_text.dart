/// A package to decorate your text easily.
library decorated_text;

import 'package:flutter/material.dart';

/// A Widget to decorate your text.
///
/// ```dart
/// DecoratedText(
///   'Decorated Text',
///   style: TextStyle( ... )
///   borderWidth: 1.5,
///   borderColor: Colors.yellow[800],
///   fillGradient: LinearGradient(
///     begin: Alignment.topCenter,
///     end: Alignment.bottomCenter,
///     stops: const [0.2, 0.55, 0.55, 0.75],
///     colors: [
///       Colors.white,
///       Colors.yellow[500],
///       Colors.yellow[800],
///       Colors.yellow[500]
///     ],
///   ),
/// )
/// ```
class DecoratedText extends StatelessWidget {
  const DecoratedText(
    this.text, {
    this.style = const TextStyle(
      color: Colors.black,
    ),
    this.borderWidth = 2,
    this.fillGradient,
    this.fillColor,
    this.borderColor = Colors.black,
  });

  static const double defaultFontSize = 20;
  static const FontWeight defaultFontWeight = FontWeight.w500;

  final TextStyle? style;

  /// Your text to be decorated.
  final String text;

  /// Border width.
  final double borderWidth;

  /// Gradient to fill your text. Don't set this with fillColor.
  final Gradient? fillGradient;

  /// Color to fill your text. Don't set this with fillGradient.
  final Color? fillColor;

  /// Border color.
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    if (fillColor != null && fillGradient != null) {
      throw StateError('You cannot set both fillColor and fillGradient.');
    }
    var textStyle = style ??
        TextStyle(
          fontWeight: defaultFontWeight,
          fontSize: defaultFontSize,
        );

    return Stack(
      children: [
        if (borderWidth > 0)
          // Some fonts overflow the bound, so padding is added to paint it.
          Padding(
            padding: EdgeInsets.only(right: textStyle.fontSize! / 2),
            child: Text(
              text,
              style: textStyle.copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  // Double the thickness beforehand, as the inner half will be filled in and disappear.
                  ..strokeWidth = borderWidth * 2
                  ..color = borderColor,
              ),
            ),
          ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bound) {
            if (fillGradient != null) {
              return fillGradient!.createShader(bound.expandToInclude(bound));
            } else {
              return LinearGradient(colors: [fillColor!, fillColor!])
                  .createShader(Rect.zero);
            }
          },
          // Some fonts overflow the bound, so padding is added to paint it.
          child: Padding(
            padding: EdgeInsets.only(right: textStyle.fontSize! / 2),
            child: Text(
              text,
              style: textStyle.copyWith(
                // Default text color is not complete black, so it's necessary to fill with true black.
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// A type that represents the static methods of the google_fonts package.
/*typedef GoogleFontStaticMethod = TextStyle Function(
    {TextStyle textStyle,
    Color color,
    Color backgroundColor,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    List<Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness});

/// GoogleFontStaticMethod for passing to fontMethod if you don't use the google_fonts package.
TextStyle _defaultFontMethod(
    {TextStyle textStyle,
    Color color,
    Color backgroundColor,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    List<Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness}) {
  return (textStyle ?? const TextStyle()).copyWith(
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  );
}*/
