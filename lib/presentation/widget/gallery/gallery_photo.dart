import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

class GalleryPhoto extends StatelessWidget {
  const GalleryPhoto(this.photo, {super.key});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: photo.thumbnailUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => const _Placeholder(),
        errorWidget: (_, __, ___) => const Placeholder(),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(child: Icon(Icons.no_photography, size: 50)),
    );
  }
}
