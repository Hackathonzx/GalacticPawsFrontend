import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:jaspr/jaspr.dart';
import 'package:galacticpawsweb/pages/homer.dart';

class HomePage extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      children: [
        DomComponent(
          tag: 'header',
          children: [
            DomComponent(
              tag: 'h1',
              children: [Text('Galactic Paws')],
            ),
          ],
        ),
        DomComponent(
          tag: 'main',
          children: [
            DomComponent(
              tag: 'div',
              styles: {'text-align': 'center'},
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: DomComponent(
                    tag: 'img',
                    attributes: {'src': 'assets/logo.png', 'width': '200', 'height': '200'},
                  ),
                ),
                DomComponent(
                  tag: 'div',
                  styles: {'margin-top': '20px'},
                  children: [
                    DomComponent(
                      tag: 'button',
                      events: {
                        'click': (event) {
                          // Define your navigation or action here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Drawer3D()),
                          );
                        },
                      },
                      children: [Text('Visit the Galaxy')],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}