import 'package:flutter/material.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    required this.errorMessage,
    required this.onRetry,
    super.key,
  });

  final String errorMessage;
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
