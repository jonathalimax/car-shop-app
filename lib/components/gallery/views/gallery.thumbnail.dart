import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_shop_app/components/loader/loader.dart';
import 'package:flutter/material.dart';

class GalleryThumbnail extends StatelessWidget {
  final GalleryItem model;
  final GestureTapCallback onTap;
  final String? origin;

  const GalleryThumbnail({
    required this.model,
    required this.onTap,
    this.origin,
  });

  @override
  Widget build(BuildContext context) {
    final tag = origin == null ? model.id : model.id + origin!;
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: tag,
          child: CachedNetworkImage(
            imageUrl: model.url,
            width: MediaQuery.of(context).size.width - 20,
            fit: BoxFit.cover,
            cacheKey: model.id.toString(),
            filterQuality: FilterQuality.high,
            placeholder: (context, url) => Center(
              child: Loader(),
            ),
          ),
        ),
      ),
    );
  }
}
