import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/assets/app_images.dart';

class CircleCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String placeholderImage;
  final double radius;
  final Color color;
  final BoxFit fit;

  const CircleCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeholderImage = AppImages.logoPng,
    this.radius = 32,
    this.color = Colors.white,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius.r,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius.r,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => CircleAvatar(
          backgroundColor: Colors.white,
          radius: (radius + 10).r,
          backgroundImage: AssetImage(placeholderImage),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.white,
          radius: (radius + 10).r,
          backgroundImage: AssetImage(placeholderImage),
        ),
      ),
    );
  }
}
