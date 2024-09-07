import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.onLike, this.onDisike});

  final Function onLike;
  final Function? onDisike;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final ValueNotifier<bool> _isLiked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(6),
        onPressed: () async {
          try {
            if (_isLiked.value) {
              await widget.onLike();
              setState(() {
                _isLiked.value = false;
              });
            } else {
              if (widget.onDisike != null) {
                await widget.onDisike!();
              }
              setState(() {
                _isLiked.value = true;
              });
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        },
        icon: _isLiked.value
            ? const Icon(
                Icons.favorite_rounded,
              )
            : const Icon(
                Icons.favorite_border_rounded,
        ));
  }
}
