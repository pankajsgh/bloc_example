import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/homeModel.dart';

class ApiService {
  Future<HomeCardModel?> getHomeCard() async {
    const String baseUrl = 'https://fakestoreapi.com/products';
    var url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var carData = jsonDecode(response.body) as List<dynamic>;
      List<CardModel> dataList = [];
      for(var x=0; x<carData.length; x++)
        {
          CardModel item = CardModel(id: carData[x]["id"], title: carData[x]["title"], image: carData[x]["image"]);
          dataList.add(item);
        }

      return HomeCardModel(card:dataList);
    } else {
      return null;
    }
  }


  Future<HomeCardModel?> getHomeCategoryCard(String cat) async {
    String baseUrl = "https://fakestoreapi.com/products/category/$cat";
    var url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var carData = jsonDecode(response.body) as List<dynamic>;
      List<CardModel> dataList = [];
      for(var x=0; x<carData.length; x++)
      {
        CardModel item = CardModel(id: carData[x]["id"], title: carData[x]["title"], image: carData[x]["image"]);
        dataList.add(item);
      }

      return HomeCardModel(card:dataList);
    } else {
      return null;
    }
  }
}