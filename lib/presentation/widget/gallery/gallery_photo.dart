import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';
import 'package:tcb_recru_task/presentation/widget/gallery/photo_preview.dart';
import 'package:tcb_recru_task/presentation/widget/gallery/placeholder.dart';

class GalleryPhoto extends StatelessWidget {
  const GalleryPhoto(this.photo, {super.key});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          showDialog(context: context, builder: (_) => PhotoPreview(photo)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: photo.thumbnailUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => const PhotoPlaceholder(),
          errorWidget: (_, __, ___) => const PhotoPlaceholder(),
        ),
      ),
    );
  }
}
