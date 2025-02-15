import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? message;
  final IconData? icon;
  final VoidCallback? onAction;
  final String? actionLabel;

  const EmptyWidget({
    super.key,
    this.message,
    this.icon,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 48,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: 16),
            Text(
              message ?? 'No items found',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (onAction != null && actionLabel != null) ...[
              const SizedBox(height: 16),
              TextButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
