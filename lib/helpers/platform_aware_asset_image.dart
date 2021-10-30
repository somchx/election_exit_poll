import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlatformAwareAssetImage extends StatelessWidget {
  const PlatformAwareAssetImage({
    Key? key,
    required this.assetPath,
    this.package,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String assetPath;
  final String? package;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$assetPath',
        width: width,
        height: height,
        fit: fit,
      );
    }

    return Image.asset(
      assetPath,
      package: package,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
