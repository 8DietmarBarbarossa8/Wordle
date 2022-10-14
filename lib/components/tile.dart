import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/providers/controller.dart';
import 'package:provider/provider.dart';

class Tile extends StatefulWidget {
  const Tile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  Color _backgroundColor = Colors.transparent,
      _borderColor = Colors.transparent;
  late AnswerStage _answerStage;
  bool _animate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _borderColor = Theme.of(context).primaryColorLight;
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        String text = '';
        if (widget.index < notifier.tilesEntered.length) {
          text = notifier.tilesEntered[widget.index].letter;
          _answerStage = notifier.tilesEntered[widget.index].answerStage;

          _animationController.forward();

          Color keyColor = Colors.white;
          switch (_answerStage) {
            case AnswerStage.correct:
              _backgroundColor = correctGreen;
              _borderColor = correctGreen;
              break;
            case AnswerStage.contains:
              _backgroundColor = containsYellow;
              _borderColor = Colors.transparent;
              break;
            case AnswerStage.incorrect:
              _backgroundColor = Theme.of(context).primaryColorDark;
              _borderColor = Colors.transparent;
              break;
            case AnswerStage.notAnswered:
              _backgroundColor = Theme.of(context).primaryColorLight;
              break;
            default:
              keyColor =
                  Theme.of(context).textTheme.bodyText2?.color ?? Colors.white;
              _backgroundColor = Colors.transparent;
          }

          return AnimatedBuilder(
            animation: _animationController,
            builder: ((context, child) {
              double flip = 0;
              if (_animationController.value > .5) {
                flip = pi;
              }
              return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, .003)
                    ..rotateX(_animationController.value * pi)
                    ..rotateX(flip),
                  child: Container(
                    decoration: _decorBox(),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          text,
                          style: const TextStyle().copyWith(color: keyColor),
                        ),
                      ),
                    ),
                  ),
                );
            }),
          );
        } else {
          return Container(
            decoration: _decorBox(),
          );
        }
      },
    );
  }

  BoxDecoration _decorBox() {
    return BoxDecoration(
      color: _backgroundColor,
      border: Border.all(
        color: _borderColor,
      ),
    );
  }
}
