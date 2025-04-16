import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/counter_cubit.dart';


class CounterBlocBuilder extends StatelessWidget {
  const CounterBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {

        return Text(context.read<CounterCubit>().counter.toString(),
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),);
      },
    );
  }
}
