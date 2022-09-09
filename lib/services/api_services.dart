import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:true_premier_football/models/standing_details_model.dart';
import 'package:true_premier_football/models/standing_model.dart';
import 'package:true_premier_football/models/standing_year_model.dart';
import '../models/match_fixture_model.dart';
import '../models/match_preview.dart';
import '/controllers/auth_controller.dart';
import '/models/user.dart';
import '/models/setting.dart';
import '/consts/consts.dart';

class ApiService {
  static var client = http.Client();
  static AuthController authController = Get.find();

  static Future<MatchFixture> loadMatches() async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.fixture);

    String body = jsonEncode(<String, dynamic>{'api_key': AppConsts.apiKey});

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return MatchFixture.fromJson(jsonDecode(jsonString));
    } else {
      return MatchFixture();
    }
  }

  static Future<MatchPreview> loadMatchePreview(String gameId) async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.preview);

    String body = jsonEncode(<String, dynamic>{
      'api_key': AppConsts.apiKey,
      'gameId': gameId,
    });

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return MatchPreview.fromJson(jsonDecode(jsonString));
    } else {
      return MatchPreview();
    }
  }

  static Future<Standing> loadStandings() async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.standings);

    String body = jsonEncode(<String, dynamic>{
      'api_key': AppConsts.apiKey,
    });

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return Standing.fromJson(jsonDecode(jsonString));
    } else {
      return Standing();
    }
  }

  static Future<StandingYear> loadStandingYear(String? link) async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.standingYear);

    String body = jsonEncode(<String, dynamic>{
      'api_key': AppConsts.apiKey,
      'url': link.toString(),
    });

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return StandingYear.fromJson(jsonDecode(jsonString));
    } else {
      return StandingYear();
    }
  }

  static Future<StandingDetails> loadStandingDetails(String years) async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.standingYearDetails);

    String body = jsonEncode(<String, dynamic>{
      'api_key': AppConsts.apiKey,
      'url': years.toString(),
    });

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return StandingDetails.fromJson(jsonDecode(jsonString));
    } else {
      return StandingDetails();
    }
  }

  static Future<Setting> loadSettings() async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.settings);

    String body = jsonEncode(<String, dynamic>{
      'api_key': AppConsts.apiKey,
    });

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return Setting.fromJson(jsonDecode(jsonString));
    } else {
      return Setting();
    }
  }

  static Future<UserModel> signup(data) async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.signup);

    data['api_key'] = AppConsts.apiKey;

    String body = jsonEncode(data);

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return UserModel.fromJson(jsonDecode(jsonString));
    } else {
      return UserModel();
    }
  }

  static Future<UserModel> signin(data) async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.signin);

    data['api_key'] = AppConsts.apiKey;

    String body = jsonEncode(data);

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return UserModel.fromJson(jsonDecode(jsonString));
    } else {
      return UserModel();
    }
  }

  static Future<UserModel> user() async {
    Uri uri = Uri.parse(AppConsts.baseUrl + AppConsts.user);
    var data = {};
    data['api_key'] = AppConsts.apiKey;

    String body = jsonEncode(data);

    var response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authController.accessToken.value}',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return UserModel.fromJson(jsonDecode(jsonString));
    } else {
      return UserModel();
    }
  }
}
