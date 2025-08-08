import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';
import 'package:tcb_recru_task/presentation/page/comments_page/cubit/comments_page_cubit.dart';
import 'package:tcb_recru_task/presentation/page/comments_page/cubit/comments_page_state.dart';

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
    final tr = context.l10n;

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: comments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.comments_name(comment.name),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 2.0),
                Text(
                  tr.comments_email(comment.email),
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                Text(comment.body, style: TextStyle(fontSize: 12.0)),
              ],
            ),
          ),
        );
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(tr.comments_error, textAlign: TextAlign.center),
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
