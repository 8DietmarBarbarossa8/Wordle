import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatsBox extends StatelessWidget {
  const StatsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
            alignment: Alignment.centerRight,
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
          const Expanded(
            child: Text(
              'STATISTICS',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
