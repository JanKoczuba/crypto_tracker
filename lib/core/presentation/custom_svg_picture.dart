import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture(
    this.path, {
    this.size,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.blendMode = BlendMode.srcIn,
    super.key,
  });

  final String path;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(path),
      fit: fit,
      width: size ?? width,
      height: size ?? height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color ?? Theme.of(context).colorScheme.onPrimaryContainer,
              blendMode,
            )
          : null,
    );
  }
}
