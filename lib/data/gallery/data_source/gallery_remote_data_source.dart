import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/gallery/dto/photo_dto.dart';
import 'package:tcb_recru_task/data/networking/api_endpoint.dart';
import 'package:tcb_recru_task/data/networking/api_response_resolver.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/data/networking/app_api_client.dart';

part 'gallery_remote_data_source.chopper.dart';

@lazySingleton
@ChopperApi()
abstract class GalleryRemoteDataSource extends ChopperService {
  @factoryMethod
  static GalleryRemoteDataSource create(AppApiClient client) {
    return _$GalleryRemoteDataSource(client);
  }

  @GET(path: ApiEndpoint.gallery)
  @FactoryConverter(response: _photoListFactory)
  Future<Response<ApiResult<List<PhotoDto>>>> getGallery();
}

Response<ApiResult<List<PhotoDto>>> _photoListFactory(
  Response<dynamic> response,
) {
  return ApiResponseResolver.resolveList(response, PhotoDto.fromJson);
}
