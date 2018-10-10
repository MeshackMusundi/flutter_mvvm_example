class Planet {
  String name, climate, terrain, gravity, population;
  int diameter;

  Planet({
    this.name,
    this.climate,
    this.terrain,
    this.diameter,
    this.gravity,
    this.population,
  });

  Planet.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    climate = map['climate'];
    terrain = map['terrain'];
    diameter = int.parse(map['diameter']);
    gravity = map['gravity'];
    population = map['population'];
  }
}