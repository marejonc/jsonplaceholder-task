import 'package:equatable/equatable.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';

sealed class CommentsPageState with EquatableMixin {
  const CommentsPageState();

  @override
  List<Object?> get props => [];
}

final class CommentsPageStateLoading extends CommentsPageState {
  const CommentsPageStateLoading();
}

final class CommentsPageStateIdle extends CommentsPageState {
  const CommentsPageStateIdle(this.comments);

  final List<Comment> comments;

  @override
  List<Object?> get props => [comments];
}

final class CommentsPageStateError extends CommentsPageState {
  const CommentsPageStateError(this.error);

  final AppError error;

  @override
  List<Object?> get props => [error];
}
