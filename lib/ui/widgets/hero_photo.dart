import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import 'dislike_button.dart';
import 'like_button.dart';

class HeroPhoto extends StatelessWidget {
  const HeroPhoto(this._image,
      {super.key,
      required this.onLike,
      required this.onDislike,
      required this.location,
      required this.name,
      required this.age});

  final List<String> _image;
  final Function onLike;
  final Function onDislike;
  final String location;
  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6 > 440
            ? 440
            : MediaQuery.of(context).size.height * .6,
        width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.75),
                            ],
                          )),
                      child: Image.network(
                        _image[index],
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return const Column(
                            children: [
                              Icon(Icons.error),
                              Text(imageNotFoundText),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  controller: pageController,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  itemCount: _image.length),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$name, $age',
                        style: Theme.of(context).textTheme.labelLarge),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 24, color: Theme.of(context).colorScheme.primary,),
                        Text(location,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        DislikeButton(onDislike: onDislike),
                        const Spacer(),
                        LikeButton(onLike: onLike),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
