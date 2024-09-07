import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/like_button.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview(this._video, {super.key, required this.onLike});
  final String _video;
  final Function onLike;

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  final ValueNotifier<String> _currentVideo = ValueNotifier('');
  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);
  late final Future<void> _playVideo;
  late final VideoPlayerController playerController;

  @override
  void initState() {
    _currentVideo.value = widget._video;
    playerController = VideoPlayerController.networkUrl(
      Uri.parse(_currentVideo.value),
    );
    _playVideo = playerController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _playVideo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox.shrink(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                if (_isPlaying.value) {
                  playerController.pause();
                  setState(() {
                    _isPlaying.value = false;
                  });
                } else {
                  playerController.play();
                  setState(() {
                    _isPlaying.value = true;
                  });
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          child: VideoPlayer(
                            playerController,
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: LikeButton(onLike: widget.onLike),
                        ),
                        Visibility(
                            visible: !_isPlaying.value,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow),
                            )),
                      ],
                    ),
                  )),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
