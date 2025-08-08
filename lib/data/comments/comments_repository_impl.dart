import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/comments/data_source/comments_remote_data_source.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/comments/comments_repository.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';

@LazySingleton(as: CommentsRepository)
class CommentsRepositoryImpl implements CommentsRepository {
  const CommentsRepositoryImpl(this._commentsRemoteDataSource);

  final CommentsRemoteDataSource _commentsRemoteDataSource;

  @override
  Future<ApiResult<List<Comment>>> getComments() async {
    try {
      final response = await _commentsRemoteDataSource.getComments();
      final result = response.body;

      return switch (result) {
        ApiResultSuccess(:final data) => ApiResultSuccess(
          data.map((dto) => dto.toDomain()).toList(),
        ),
        final _ => ApiResultFailure(apiError),
      };
    } on SocketException {
      return ApiResultFailure(AppErrorNetwork());
    } catch (e) {
      return ApiResultFailure(apiError);
    }
  }
}
