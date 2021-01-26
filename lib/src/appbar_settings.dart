import 'package:flutter/material.dart';

import 'package:set_state/set_state.dart';

class BottomSetting {
  factory BottomSetting(Brightness brightness, void Function(Brightness v) func) =>
      _this ??= BottomSetting._(brightness, func);
  BottomSetting._(Brightness brightness, void Function(Brightness v) func) {
    radio = GroupValue<Brightness>(brightness, func);
  }
  static BottomSetting _this;

  GroupValue<Brightness> radio;

  Column get radioButtons {
    return Column(children: [
      const Text('Brightness'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Light'),
          Radio(
            value: Brightness.light,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
          const Text('Dark'),
          Radio(
            value: Brightness.dark,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
        ],
      ),
    ]);
  }
}

class BrightnessSetting {
  factory BrightnessSetting(
          Brightness brightness, void Function(Brightness v) func) =>
      _this ??= BrightnessSetting._(brightness, func);
  BrightnessSetting._(Brightness brightness, void Function(Brightness v) func) {
    radio = GroupValue<Brightness>(brightness, func);
  }
  static BrightnessSetting _this;

  GroupValue<Brightness> radio;
  Column get radioButtons {
    return Column(children: [
      const Text('Brightness'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Light'),
          Radio(
            value: Brightness.light,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
          const Text('Dark'),
          Radio(
            value: Brightness.dark,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
        ],
      ),
    ]);
  }
}

class GroupValue<E> {
  GroupValue(this.groupValue, this.func) {
    // Retrieve the most recent SetState object instantiated.
    state = StateSet.root;
  }
  E groupValue;
  final void Function(E v) func;
  StateSet state;

  void onChanged<T>(T v) => state?.setState(() {
//        final value = v as E;
        if (v is E) {
          groupValue = v;
          func(v);
        }
      });
}
