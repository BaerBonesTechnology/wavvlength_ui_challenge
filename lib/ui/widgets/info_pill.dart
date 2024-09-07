import 'package:flutter/material.dart';

class InfoPill extends StatelessWidget {
  const InfoPill(
      {super.key,
      this.icon = Icons.info,
      this.isSelected,
      required this.text,
      this.width});

  final IconData icon;
  final bool? isSelected;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: .63,
        ),
      ),
        color: isSelected != null && isSelected == true
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.surface,
        child: SizedBox(
          width: width != null
              ? width! < 200
                  ? width
                  : 200
              : null,
          height: 35,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: isSelected != null && isSelected == true
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  text,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isSelected != null && isSelected == true
                          ? Theme.of(context).colorScheme.surface
                          : Theme.of(context).textTheme.labelSmall?.color),
                ),
              ],
            ),
          ),
        ));
  }
}
