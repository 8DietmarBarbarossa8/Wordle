import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  int currentTile = 0, currentRow = 0;
  setKeyTapped({required String value}) {
    if (value == 'ENTER') {
      if (currentTile == 5 * (currentRow + 1)) {
        currentRow++;
      }
    } else if (value == 'BACK') {
      if (currentTile > 5 * (currentRow + 1) - 5) {
        currentTile--;
      }
    } else {
      if (currentTile < 5 * (currentRow + 1)) {
        currentTile++;
      }
    }
  }
}
