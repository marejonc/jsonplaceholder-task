import 'package:equatable/equatable.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

sealed class GalleryPageState with EquatableMixin {
  const GalleryPageState();

  @override
  List<Object?> get props => [];
}

final class GalleryPageStateLoading extends GalleryPageState {
  const GalleryPageStateLoading();
}

final class GalleryPageStateIdle extends GalleryPageState {
  const GalleryPageStateIdle(this.photos);

  final List<Photo> photos;

  @override
  List<Object?> get props => [photos];
}

final class GalleryPageStateError extends GalleryPageState {
  const GalleryPageStateError(this.error);

  final AppError error;

  @override
  List<Object?> get props => [error];
}
