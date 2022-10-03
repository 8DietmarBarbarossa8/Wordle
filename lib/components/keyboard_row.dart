import 'package:flutter/material.dart';
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
    int index = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keysMap.entries.map((e) {
        index++;
        return index >= min && index <= max
            ? Padding(
                padding: EdgeInsets.all(size.width * .006),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    width: size.width *
                        (e.key == 'ENTER' || e.key == 'BACK' ? .13 : .085),
                    height: size.height * .09,
                    color: Colors.red,
                    child: Material(
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
              )
            : const SizedBox();
      }).toList(),
    );
  }
}
