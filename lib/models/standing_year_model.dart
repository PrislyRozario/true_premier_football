class StandingYear {
  List<Year>? year;

  StandingYear({this.year});

  StandingYear.fromJson(Map<String, dynamic> json) {
    if (json['year'] != null) {
      year = <Year>[];
      json['year'].forEach((v) {
        year!.add(new Year.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.year != null) {
      data['year'] = this.year!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Year {
  String? ids;
  String? year;
  String? link;

  Year({this.ids, this.year, this.link});

  Year.fromJson(Map<String, dynamic> json) {
    ids = json['ids'];
    year = json['year'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ids'] = this.ids;
    data['year'] = this.year;
    data['link'] = this.link;
    return data;
  }
}
