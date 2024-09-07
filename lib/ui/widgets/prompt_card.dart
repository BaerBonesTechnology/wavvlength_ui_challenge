import 'package:flutter/material.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/like_button.dart';

class PromptCard extends StatelessWidget {
  const PromptCard({super.key, required this.prompt, required this.response, required this.onLike});

  final String prompt;
  final String response;
  final Function onLike;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prompt,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              response,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LikeButton(onLike: onLike),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
