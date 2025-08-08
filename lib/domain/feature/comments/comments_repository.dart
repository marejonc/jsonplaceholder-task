import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';

abstract interface class CommentsRepository {
  Future<ApiResult<List<Comment>>> getComments();
}
