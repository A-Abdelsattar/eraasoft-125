import 'package:counter_state/features/counter/cubit/counter_cubit.dart';
import 'package:counter_state/features/counter/presentation/widgets/counter_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild build");
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CounterBlocBuilder(),
            IconButton(onPressed: () {
              context.read<CounterCubit>().incrementCounter();
            }, icon: Icon(Icons.add, size: 40,)),
            IconButton(onPressed: () {
              context.read<CounterCubit>().decrementCounter();
            }, icon: Icon(Icons.remove, size: 40,)),


          ],
        ),
      ),
    );
  }
}
