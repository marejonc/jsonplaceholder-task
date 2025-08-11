import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';
import 'package:tcb_recru_task/presentation/widget/gallery/placeholder.dart';

class PhotoPreview extends StatelessWidget {
  const PhotoPreview(this.photo, {super.key});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 48.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.all(8.0),
                    iconSize: 36.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                      child: Text(
                        photo.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CachedNetworkImage(
                  imageUrl: photo.url,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => const PhotoPlaceholder(),
                  errorWidget: (_, __, ___) => const PhotoPlaceholder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
