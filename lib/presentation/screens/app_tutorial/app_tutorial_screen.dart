import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Nostrud dolor Lorem anim sunt dolore.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Excepteur duis proident veniam Lorem quis amet culpa amet minim laboris nulla incididunt.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'disfruta  la comida',
      caption:
          'In cupidatat ipsum fugiat laboris nulla ut quis tempor cupidatat in enim occaecat ut ex.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReachd = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReachd && page >= (slides.length -1.5)){
        setState(() {
          endReachd = true;
        });
      }

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReachd ? 
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop(),
              ),
            ),
          ):const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
