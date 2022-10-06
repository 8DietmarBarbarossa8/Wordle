import 'package:flutter/material.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/controller.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:provider/provider.dart';

class KeyBoardRow extends StatelessWidget {
  const KeyBoardRow({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<Controller>(
      builder: ((context, value, child) {
        int index = 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keysMap.entries.map((e) {
            index++;
            if (index >= min && index <= max) {
              Color color = Colors.grey;
              switch (e.value) {
                case AnswerStage.correct:
                  color = correctGreen;
                  break;
                case AnswerStage.contains:
                  color = containsYellow;
                  break;
                case AnswerStage.incorrect:
                  // TODO: Handle this case.
                  break;
                case AnswerStage.notAnswered:
                  // TODO: Handle this case.
                  break;
              }
              return Padding(
                padding: EdgeInsets.all(size.width * .006),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: size.width *
                        (e.key == 'ENTER' || e.key == 'BACK' ? .13 : .085),
                    height: size.height * .09,
                    child: Material(
                      color: color,
                      child: InkWell(
                        onTap: () {
                          Provider.of<Controller>(context, listen: false)
                              .setKeyTapped(
                            value: e.key,
                          );
                        },
                        child: Center(child: Text(e.key)),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }).toList(),
        );
      }),
    );
  }
}
