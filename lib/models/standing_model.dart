class Standing {
  List<League>? league;

  Standing({this.league});

  Standing.fromJson(Map<String, dynamic> json) {
    if (json['league'] != null) {
      league = <League>[];
      json['league'].forEach((v) {
        league!.add(new League.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.league != null) {
      data['league'] = this.league!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  String? ids;
  String? name;
  String? link;

  League({this.ids, this.name, this.link});

  League.fromJson(Map<String, dynamic> json) {
    ids = json['ids'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ids'] = this.ids;
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}
