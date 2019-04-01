import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_tutorial/pages/test/datetime_cupertino_picker.dart';

Future showDatettimeWheelSelect(
    {@required BuildContext context,
    @required int startYear,
    @required int endYear,
    List<int> initValue,
    Function callback,
    String title}) async {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return DatetimeCupertinoPicker(
          startYear: startYear,
          endYear: endYear,
          initValue: initValue,
          callback: (value) {
            callback(value);
          },
        );
      });
}
