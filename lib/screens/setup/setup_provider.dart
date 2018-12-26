import 'package:flutter/widgets.dart';
import 'package:debout/screens/setup/setup_bloc.dart';

class SetupProvider extends InheritedWidget {
  final SetupBloc setupBloc;

  SetupProvider({
    @required this.setupBloc,
    Widget child
  }): super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SetupBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SetupProvider) as SetupProvider).setupBloc;
}