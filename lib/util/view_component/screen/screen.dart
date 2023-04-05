import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/di/factory/view_model_factory.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenState createState();
}

abstract class ScreenState<T extends Screen, T2 extends ViewModel<T3>, T3 extends StateData> extends State<T> {
  late final T2 viewModel;

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) {
        if (!viewModel.event.hasListener) {
          viewModel.event.stream.listen((event) async {
            if (event == Event.ERROR) {
              await Navigator.pushNamed(context, ErrorScreen.routeName, arguments: viewModel.state.error);
            }
          });
        }
        return viewModel;
      },
      child: BlocListener<T2, T3>(
        bloc: viewModel,
        listener: (context, state) async {

        },
        child: buildScreen(context),
      ),
    );
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = context.read<ViewModelFactory>().create<T2>();
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    viewModel.close();
  }
}
