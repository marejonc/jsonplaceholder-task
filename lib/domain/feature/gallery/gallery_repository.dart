import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

abstract interface class GalleryRepository {
  Future<ApiResult<List<Photo>>> getGallery();
}
