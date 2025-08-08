import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/feature/comments/comments_repository.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';

@injectable
class GetComments {
  const GetComments(this._commentsRepository);

  final CommentsRepository _commentsRepository;

  Future<ApiResult<List<Comment>>> call() {
    return _commentsRepository.getComments();
  }
}
