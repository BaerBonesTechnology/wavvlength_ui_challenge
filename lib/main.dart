import 'package:flutter/material.dart';
import 'package:wavvlength_ui_challenge/constants/strings.dart';
import 'package:wavvlength_ui_challenge/ui/screens/main_screen.dart';
import 'package:wavvlength_ui_challenge/ui/theme/app_theme.dart';

import 'models/info.dart';
import 'models/prompt.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      home: MainScreen(
        user: User(
          name: 'Neil deGrasse Tyson',
          age: 63,
          heightInCm: 187.96,
          bio:
              'I am an Astrophysicist and Science Communicator. I am the Frederick P. Rose Director of the Hayden Planetarium at the Rose Center for Earth and Space, both part of the American Museum of Natural History. I am a research associate in the Department of Astrophysics at the American Museum of Natural History.',
          job: 'Astrophysicist',
          education: 'Ph.D. of Astrophysics',
          location: 'Philadelphia, PA',
          savedMedia: [
            'https://hips.hearstapps.com/hmg-prod/images/gettyimages-487238689.jpg',
            'https://www.jacksonville.com/gcdn/authoring/2017/10/12/NFTU/ghows-LK-1b6def9e-2212-404c-8d53-caaab5525598-47c3581e.jpeg',
            'https://hbr.org/resources/images/article_assets/2015/12/R1601L_TYSON.jpg',
            'https://miro.medium.com/v2/resize:fit:1400/1*KSANsuaNfVP5TzHQkQaSjA.jpeg',
            'https://i0.wp.com/tim.blog/wp-content/uploads/2019/10/neiltysonamazon1.jpg',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Tyson_-_Apollo_40th_anniversary_2009.jpg/1200px-Tyson_-_Apollo_40th_anniversary_2009.jpg',
            'https://www.schottensteincenter.com/assets/img/NDT_436x320-22284b945e.jpg',
            'https://media.npr.org/assets/img/2015/10/22/gettyimages-475425810-822eb55bf55c00b1e4ecf3f3e87bbe871ea1cb61.jpg',
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          ],
          instagramPhotos: [
            'https://hips.hearstapps.com/hmg-prod/images/gettyimages-487238689.jpg',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg/800px-Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg',
            'https://img-cdn.inc.com/image/upload/w_1024,h_576,c_fill/images/panoramic/neil-degrasse-tyson-inc_541018_mpnyrl.jpg',
            'https://cdn.aarp.net/content/dam/aarp/entertainment/celebrities/2022/09/1140-neil-degrasse-tyson.jpg',
            'https://i0.wp.com/www.themarginalian.org/wp-content/uploads/2014/12/neildegrassetyson.jpg',
            'https://media.wired.com/photos/5978e19d57beec1e84cbd925/master/w_2560%2Cc_limit/NeilDegrasseTyson-TA-698525436.jpg',
            'https://i.abcnewsfe.com/a/6b1719ba-3b15-4b75-b9ce-f9108814a983/tyson-1-gty-er-230912_1694541296498_hpMain.jpg',
            'https://www.interviewmagazine.com/wp-content/uploads/2016/11/img-neil-degrasse-tyson_180827371383.jpg',
          ],
          prompts: [
            Prompt(
              prompt: 'What is your favorite planet?',
              response: 'Earth',
            ),
            Prompt(
              prompt: 'What is your favorite star?',
              response: 'The Sun',
            ),
            Prompt(
              prompt: 'What is your favorite galaxy?',
              response: 'The Milky Way',
            ),
          ],
          hobbies: [
            const Info(
              name: 'Astronomy',
              icon: Icons.star,
            ),
            const Info(
              name: 'Physics',
              icon: Icons.science,
            ),
            const Info(
              name: 'Mathematics',
              icon: Icons.calculate,
            ),
            const Info(
              name: 'Astrophysics',
              icon: Icons.stars,
            ),
          ],
        ),
        currentUser: User(hobbies: [
          const Info(
            name: 'Astronomy',
            icon: Icons.star,
          ),
          const Info(
            name: 'Physics',
            icon: Icons.science,
          ),
          const Info(
            name: 'Astrophysics',
            icon: Icons.stars,
          ),
        ]),
      ),
    );
  }
}
