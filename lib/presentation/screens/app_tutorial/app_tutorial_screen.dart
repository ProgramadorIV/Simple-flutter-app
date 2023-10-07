import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String subtitle;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Search for food',
      subtitle:
          'Consequat quis nostrud commodo veniam laboris ullamco elit in.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Find it',
      subtitle: 'Elit amet ullamco velit commodo dolore laboris culpa velit.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Enjoy!',
      subtitle: 'Aliqua eu eiusmod aliquip voluptate aliqua.',
      imageUrl: 'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final currentPage = pageController.page ?? 0;
      if (!endReached && currentPage >= slides.length - 1.7) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (e) => _Slide(
                    title: e.title,
                    subtitle: e.subtitle,
                    imageUrl: e.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('End tutorial'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
