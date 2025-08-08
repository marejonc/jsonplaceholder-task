import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/feature/gallery/gallery_repository.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

@injectable
class GetPhotos {
  const GetPhotos(this._galleryRepository);

  final GalleryRepository _galleryRepository;

  Future<ApiResult<List<Photo>>> call() {
    return _galleryRepository.getGallery();
  }
}
