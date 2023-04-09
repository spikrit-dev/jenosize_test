import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jenosize/core/network.dart';
import 'package:jenosize/infrastructure/source/github/models/res_model.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const url =
      'https://spikrit-dev.github.io/Restuarants-Api/restuarant.json';

  final NetworkManager networkManager;

  // Future<List<GithubRestuarantModel>> getRestuarants() async {
  //   final response = await networkManager.request(RequestMethod.get, url);
  // final response = await http.get(Uri(path: url));

  // final data = (json.decode(response.body) as List)
  //     .map((restuarant) => GithubRestuarantModel.fromJson(restuarant))
  //     .toList();

  // return data;
  //   final data = (json.decode(response.data) as List)
  //       .map((restuarant) => GithubRestuarantModel.fromJson(restuarant))
  //       .toList();

  //   return data;
  // }

  Future<List<Restaurant>?> getRestaurant() async {
    final client = http.Client();
    final uri = Uri.parse(url);
    final response = await client.get(uri);
    final body = response.body;
    final List parsedList = json.decode(body);
    List<Restaurant> list =
        parsedList.map((x) => Restaurant.fromJson(x)).toList();

    return list;
  }
}
