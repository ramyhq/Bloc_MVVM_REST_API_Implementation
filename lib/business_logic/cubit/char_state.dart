part of 'char_cubit.dart';

@immutable
abstract class CharState {}

class CharInitial extends CharState {}
class CharsLoaded extends CharState {
  final List<Character> chars;

  CharsLoaded(this.chars);
}
