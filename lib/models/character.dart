class Character {
  String name, birthYear, gender, eyeColor;
  int height;

  Character({
    this.name,
    this.birthYear,
    this.gender,
    this.height,
    this.eyeColor,
  });

  Character.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    birthYear = map['birth_year'];
    gender = map['gender'];
    height = int.parse(map['height']);
    eyeColor = map['eye_color'];
  }
}