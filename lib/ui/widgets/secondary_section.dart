import 'package:flutter/material.dart';
import 'package:wavvlength_ui_challenge/ui/theme/app_theme.dart';

class SecondaryPhotoSection extends StatelessWidget {
  const SecondaryPhotoSection(
      {super.key,
      required this.sectionTitle,
      required this.children,
      this.direction = Axis.vertical});

  final String sectionTitle;
  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: secondaryStroke,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: children.length < 8 ? children.length : 8,
                  itemBuilder: (context, index) {
                    return children[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
