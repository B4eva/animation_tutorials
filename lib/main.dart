import 'package:animation_tut/pages/animated_container_page.dart';
import 'package:animation_tut/pages/animated_opacity_page.dart';
import 'package:animation_tut/pages/tween_animation_builder_page.dart';
import 'package:flutter/material.dart';

enum AnimationExample {
  animatedContainer,
  animatedOpacity,
  tweenAnimationBuilder,
}

extension on AnimationExample {
  String capitalizeFirstCharacter() {
    return name.replaceRange(0, 1, name.characters.first.toUpperCase());
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Animations Playground')),
        body: const AnimationExamplesList(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'animatedContainer':
            return MaterialPageRoute(
              builder: (_) => const AnimatedContainerPage(),
            );

          case 'animatedOpacity':
            return MaterialPageRoute(
                builder: (_) => const AnimatedOpacityPage());
          case 'tweenAnimationBuilder':
            return MaterialPageRoute(
                builder: (_) => const TweenAnimationBuilderPage());
          default:
            throw UnimplementedError('Route ${settings.name} not implemented');
        }

        //!! IF statement equivilence
        // if (settings.name == 'animatedContainer') {
        //   return MaterialPageRoute(
        //       builder: (_) => const AnimatedContainerPage());
        // } else if (settings.name == 'animatedOpacity') {
        //   return MaterialPageRoute(builder: (_) => const AnimatedOpacityPage());
        // } else if (settings.name == 'tweenAnimationBuilder') {
        //   return MaterialPageRoute(
        //       builder: (_) => const TweenAnimationBuilderPage());
        // }
        // throw UnimplementedError('Route ${settings.name} not implemented');
      },
    );
  }
}

class AnimationExamplesList extends StatelessWidget {
  const AnimationExamplesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final example = AnimationExample.values[index];
        final routeName = example.name;
        return ListTile(
          title: Text(example.capitalizeFirstCharacter()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(routeName),
        );
      },
      itemCount: AnimationExample.values.length,
    );
  }
}
