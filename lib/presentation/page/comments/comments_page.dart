import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';
import 'package:tcb_recru_task/presentation/page/comments/cubit/comments_page_cubit.dart';
import 'package:tcb_recru_task/presentation/page/comments/cubit/comments_page_state.dart';
import 'package:tcb_recru_task/presentation/widget/comments/comment_tile.dart';

class CommentsPage extends HookWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CommentsPageCubit>();
    final state = useBlocBuilder(cubit);

    final tr = context.l10n;

    useEffect(() {
      cubit.init();

      return null;
    }, [cubit]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        scrolledUnderElevation: 0,
        title: Text(tr.comments),
      ),
      body: switch (state) {
        CommentsPageStateLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        CommentsPageStateIdle(:final comments) => _IdleContent(comments),
        CommentsPageStateError(:final error) => _ErrorContent(
          error: error,
          onRetry: cubit.init,
        ),
      },
    );
  }
}

class _IdleContent extends StatelessWidget {
  const _IdleContent(this.comments);

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: comments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      itemBuilder: (context, index) {
        final comment = comments[index];

        return CommentTile(comment);
      },
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({required this.error, required this.onRetry});

  final AppError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final tr = context.l10n;

    final errorMessage = switch (error) {
      AppErrorNetwork() => tr.network_error,
      final _ => tr.comments_error,
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(errorMessage, textAlign: TextAlign.center),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: onRetry,
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
            child: Text(tr.retry),
          ),
        ],
      ),
    );
  }
}
