part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class IncrementState extends CounterState{}
class DecrementState extends CounterState{}