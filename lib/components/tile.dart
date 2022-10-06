import 'package:flutter/material.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/controller.dart';
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

class _TileState extends State<Tile> {
  Color _backgroundColor = Colors.transparent;
  late AnswerStage _answerStage;
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        String text = '';
        if (widget.index < notifier.tilesEntered.length) {
          text = notifier.tilesEntered[widget.index].letter;
          _answerStage = notifier.tilesEntered[widget.index].answerStage;

          switch (_answerStage) {
            case AnswerStage.correct:
              _backgroundColor = correctGreen;
              break;
            case AnswerStage.contains:
              _backgroundColor = containsYellow;
              break;
            case AnswerStage.incorrect:
              // TODO: Handle this case.
              break;
            case AnswerStage.notAnswered:
              // TODO: Handle this case.
              break;
          }

          return Container(
            color: _backgroundColor,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(text),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
