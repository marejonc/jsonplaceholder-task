import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/use_case/comments/get_comments.dart';
import 'package:tcb_recru_task/presentation/page/comments/cubit/comments_page_state.dart';

@injectable
class CommentsPageCubit extends Cubit<CommentsPageState> {
  CommentsPageCubit(this._getComments)
    : super(const CommentsPageStateLoading());

  final GetComments _getComments;

  Future<void> init() async {
    final result = await _getComments();

    switch (result) {
      case ApiResultSuccess(:final data):
        emit(CommentsPageStateIdle(data));

      case ApiResultFailure(:final error):
        emit(CommentsPageStateError(error));
    }
  }
}
