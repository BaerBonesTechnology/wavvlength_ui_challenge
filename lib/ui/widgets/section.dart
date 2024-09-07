import 'package:flutter/material.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/like_button.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.sectionTitle,
    required this.children,
    this.direction = Axis.horizontal,
    this.spaceBetween,
    this.likable = false,
    this.onLike,
    this.grid = false,
    this.height,
  });

  final String sectionTitle;
  final List<Widget> children;
  final Axis direction;
  final double? spaceBetween;
  final bool likable;
  final Function()? onLike;
  final bool grid;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle.isNotEmpty ?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  sectionTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  softWrap: true,
                ),
              ),
            ):
              const SizedBox( height: 16,),
          Center(
            child: SingleChildScrollView(
              scrollDirection: direction,
              child: grid
                  ? SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: direction,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          mainAxisExtent: 200,
                        ),
                        itemCount: children.length,
                        itemBuilder: (context, index) {
                          return children[index];
                        },
                      ),
                    )
                  : (direction == Axis.horizontal)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children
                              .map((child) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: spaceBetween ?? 8),
                                    child: child,
                                  ))
                              .toList(),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: children
                              .map((child) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: spaceBetween ?? 8),
                                    child: child,
                                  ))
                              .toList(),
                        ),
            ),
          ),
          if (likable)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                LikeButton(onLike: () {}),
              ]),
            ),
        ],
      ),
    );
  }
}
