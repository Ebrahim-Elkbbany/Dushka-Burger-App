import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductHeaderImage extends StatelessWidget {
  final String imageUrl;

  const ProductHeaderImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      radius: 12,
      width: double.infinity,
      height: context.h(300),
      fit: BoxFit.cover,
      imageUrl: imageUrl,
    );
  }
}
