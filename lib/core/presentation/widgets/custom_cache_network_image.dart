import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (borderRadius == null && boxShadow != null) {
      return _buildImageWidget(context);
    }
    return Container(
      decoration:
          BoxDecoration(borderRadius: borderRadius, boxShadow: boxShadow),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: _buildImageWidget(context),
    );
  }

  CachedNetworkImage _buildImageWidget(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Container(color: Colors.grey.shade200),
      errorWidget: (context, url, err) =>
          Container(color: Colors.grey.shade200),
      fadeInDuration: const Duration(milliseconds: 350),
      fadeOutDuration: const Duration(milliseconds: 250),
      fadeInCurve: Curves.easeIn,
      fadeOutCurve: Curves.easeIn,
      height: height,
      width: width,
    );
  }
}
