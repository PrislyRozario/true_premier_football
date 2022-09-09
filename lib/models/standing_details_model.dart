class StandingDetails {
  List<Team>? team;
  List<Point>? point;

  StandingDetails({this.team, this.point});

  StandingDetails.fromJson(Map<String, dynamic> json) {
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
    if (json['point'] != null) {
      point = <Point>[];
      json['point'].forEach((v) {
        point!.add(new Point.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    if (this.point != null) {
      data['point'] = this.point!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? heding;
  String? logo;

  Team({this.heding, this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    heding = json['heding'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heding'] = this.heding;
    data['logo'] = this.logo;
    return data;
  }
}

class Point {
  String? gP;
  String? w;
  String? d;
  String? l;
  String? gF;
  String? gA;
  String? gD;
  String? p;

  Point({this.gP, this.w, this.d, this.l, this.gF, this.gA, this.gD, this.p});

  Point.fromJson(Map<String, dynamic> json) {
    gP = json['GP'];
    w = json['W'];
    d = json['D'];
    l = json['L'];
    gF = json['GF'];
    gA = json['GA'];
    gD = json['GD'];
    p = json['P'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GP'] = this.gP;
    data['W'] = this.w;
    data['D'] = this.d;
    data['L'] = this.l;
    data['GF'] = this.gF;
    data['GA'] = this.gA;
    data['GD'] = this.gD;
    data['P'] = this.p;
    return data;
  }
}
