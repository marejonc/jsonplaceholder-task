import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/gallery/data_source/gallery_remote_data_source.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/gallery/gallery_repository.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

@LazySingleton(as: GalleryRepository)
class GalleryRepositoryImpl implements GalleryRepository {
  const GalleryRepositoryImpl(this._galleryRemoteDataSource);

  final GalleryRemoteDataSource _galleryRemoteDataSource;

  @override
  Future<ApiResult<List<Photo>>> getGallery() async {
    try {
      final response = await _galleryRemoteDataSource.getGallery();
      final result = response.body;

      return switch (result) {
        ApiResultSuccess(:final data) => ApiResultSuccess(
          data.map((dto) => dto.toDomain()).toList(),
        ),
        final _ => ApiResultFailure(apiError),
      };
    } catch (e) {
      return ApiResultFailure(apiError);
    }
  }
}
