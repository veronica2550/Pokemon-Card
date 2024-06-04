class Pokemon{
  final int id;
  final String name;
  final String imgurl;
  
  Pokemon({
    required this.id,
    required this.name,
    required this.imgurl,
  });
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imgurl: json['sprites']['front_default']
    );
  }
}