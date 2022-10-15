import 'package:flutter/material.dart';
import 'package:wordle/animations/bounce.dart';
import 'package:wordle/components/tile.dart';
import 'package:wordle/providers/controller.dart';
import 'package:provider/provider.dart';

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(36, 20, 36, 20),
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Consumer<Controller>(
          builder: (_, notifier, __) {
            return Bounce(
              animate:
                  index == notifier.currentTile - 1 && !notifier.isBackOrEnter,
              child: Tile(
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
