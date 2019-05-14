import 'bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final BLoC bLoC = BLoC();

  final BLoCTheme bLoCTheme = BLoCTheme();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static BLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;

  static BLoCTheme ofBloCTheme(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .bLoCTheme;
}
