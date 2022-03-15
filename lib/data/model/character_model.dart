

class CharacterModel {
  final Info info;
  final List<Results> results;

  CharacterModel({required this.info, required this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {

    final List<Results> list = [];

    for(int i = 0; i < json['results'].length; i++) {
      list.add(Results.fromJson(json['results'][i]));
    }

    return CharacterModel(
      info: Info.fromJson(json['info']),
      results: list,
    );
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({required this.count, required this.pages, required this.next, required this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'] ?? "";
    prev = json['prev'] ?? "";
  }

}

class Results {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Origin location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
   return Results(
     id:json['id'],
     name: json['name'],
     status: json['status'],
     species: json['species'],
     type: json['type'],
     gender: json['gender'],
     origin: Origin.fromJson(json['origin']),
     location: Origin.fromJson(json['location']),
     image: json['image'],
     episode: json['episode'].cast<String>(),
     url: json['url'],
     created: json['created'],
   );
  }
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] ?? "",
      url: json['url'] ?? "",
    );
  }
}
