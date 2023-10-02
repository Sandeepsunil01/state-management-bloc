import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter/counter_bloc.dart';

class BlocExtensionUsage extends StatelessWidget {
  const BlocExtensionUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${context.watch<CounterBloc>().state.counter}",
        style: const TextStyle(fontSize: 52),
      ),
    );
  }
}
