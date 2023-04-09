import 'dart:convert';

import 'package:jenosize/core/network.dart';
import 'package:jenosize/infrastructure/source/github/models/restuarant.dart';
import 'package:jenosize/infrastructure/source/github/models/res_model.dart';
import 'package:http/http.dart' as http;

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const url =
      'https://spikrit-dev.github.io/Restuarants-Api/restuarant.json';

  final NetworkManager networkManager;

  Future<List<GithubRestuarantModel>> getRestuarants() async {
    final response = await networkManager.request(RequestMethod.get, url);
    // final response = await http.get(Uri(path: url));

    // final data = (json.decode(response.body) as List)
    //     .map((restuarant) => GithubRestuarantModel.fromJson(restuarant))
    //     .toList();

    // return data;
    final data = (json.decode(response.data) as List)
        .map((restuarant) => GithubRestuarantModel.fromJson(restuarant))
        .toList();

    return data;
  }

  Future<List<Restaurant>?> getRestaurant() async {
    var client = http.Client();
    var uri = Uri.parse(url);
    var response = await client.get(uri);
    // if (response.statusCode == 200) {
    var json = response.body;
    return restuarantFromJson(json);
    // }
  }
}
