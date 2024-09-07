import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DislikeButton extends StatelessWidget{
  const DislikeButton({super.key, required this.onDislike});

  final Function onDislike;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(6),
        onPressed: () async {
          try {
            await onDislike();
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        },
        icon: const Icon(Icons.close_rounded),);
  }
}
