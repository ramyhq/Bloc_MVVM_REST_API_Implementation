
class Character {
   int? charId;
   String? Name;
   String? nickName;
   String? image;

  Character.fromJson(Map<String,dynamic>json){
     charId = json['char_id'];
     Name = json['name'];
     nickName = json['nickname'];
     image = json['img'];

  }
}