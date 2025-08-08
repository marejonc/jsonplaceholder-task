import 'package:equatable/equatable.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

sealed class GalleryPageState {
  const GalleryPageState();
}

final class GalleryPageStateLoading extends GalleryPageState {
  const GalleryPageStateLoading();
}

final class GalleryPageStateIdle extends GalleryPageState with EquatableMixin {
  const GalleryPageStateIdle(this.photos);

  final List<Photo> photos;

  @override
  List<Object?> get props => [photos];
}

final class GalleryPageStateError extends GalleryPageState {
  const GalleryPageStateError(this.error);

  final AppError error;
}
