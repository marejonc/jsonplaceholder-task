import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/comments/dto/comment_dto.dart';
import 'package:tcb_recru_task/data/networking/api_endpoint.dart';
import 'package:tcb_recru_task/data/networking/api_response_resolver.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/data/networking/app_api_client.dart';

part 'comments_remote_data_source.chopper.dart';

@lazySingleton
@ChopperApi()
abstract class CommentsRemoteDataSource extends ChopperService {
  @factoryMethod
  static CommentsRemoteDataSource create(AppApiClient client) {
    return _$CommentsRemoteDataSource(client);
  }

  @GET(path: ApiEndpoint.comments)
  @FactoryConverter(response: _commentListFactory)
  Future<Response<ApiResult<List<CommentDto>>>> getComments();
}

Response<ApiResult<List<CommentDto>>> _commentListFactory(
  Response<dynamic> response,
) {
  return ApiResponseResolver.resolveList(response, CommentDto.fromJson);
}
