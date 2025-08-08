import 'package:flutter/material.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';

class CommentTile extends StatelessWidget {
  const CommentTile(this.comment, {super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final tr = context.l10n;

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
  }
}
