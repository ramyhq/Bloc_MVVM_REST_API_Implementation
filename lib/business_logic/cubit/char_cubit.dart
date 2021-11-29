import 'package:bloc/bloc.dart';
import 'package:bloc_learn/data/models/characters.dart';
import 'package:bloc_learn/data/repostiry/char_repostiry.dart';
import 'package:meta/meta.dart';

part 'char_state.dart';

class CharCubit extends Cubit<CharState> {
  final CharRepository charRepository;
  List<Character>? chars;
  CharCubit(this.charRepository) : super(CharInitial());

  List<Character>? getAllCharecters(){
    charRepository.getAllCharecters().then((chars) {
      emit(CharsLoaded(chars));
      this.chars = chars;
    });
    return chars;
  }
}
