import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/assets/app_images.dart';

class RoundedCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholderImage;
  final double radius;
  final double width;
  final double height;
  final Color color;
  final BoxFit fit;

  const RoundedCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeholderImage = AppImages.logoPng,
    this.radius = 8,
    this.width = 85,
    this.height = 100,
    this.color = Colors.white,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.r)),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? 'https//test.te/images/test.png',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius.r),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius.r),
            image: DecorationImage(image: AssetImage(placeholderImage), fit: fit),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius.r),
            image: DecorationImage(image: AssetImage(placeholderImage), fit: fit),
          ),
        ),
      ),
    );
  }
}
