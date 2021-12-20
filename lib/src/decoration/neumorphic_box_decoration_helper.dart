import 'package:flutter/widgets.dart';

import '../theme/theme.dart';

Shader getGradientShader({
  required Rect gradientRect,
  required LightSource source,
  required TextDirection textDirection,
  double intensity = 0.25,
}) {
  var sourceInvert = source.invert();

  final currentIntensity = intensity * (3 / 5);

  final Gradient gradient = LinearGradient(
    begin: AlignmentDirectional(source.dx, source.dy),
    end: AlignmentDirectional(sourceInvert.dx, sourceInvert.dy),
    colors: <Color>[
      NeumorphicColors.gradientShaderDarkColor(intensity: currentIntensity),
      NeumorphicColors.gradientShaderWhiteColor(
          intensity: currentIntensity * (2 / 5)),
    ],
    stops: [
      0,
      0.75, //was 1 but set to 0.75 to be less dark
    ],
  );

  return gradient.createShader(gradientRect, textDirection: textDirection);
}
