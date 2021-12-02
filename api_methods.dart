import 'dart:convert';

import 'package:http/http.dart' as http;

Future<double> getPrice(String id) async {
  try {
    var url = "https://api.coingecko.com/api/v3/coins/" + id;

    var getResponse = await http.get(Uri.parse(url));
    var json = jsonDecode(getResponse.body);
    var value = json['market_data']['current_price']['usd'].toString();
    var price = double.parse(value);
    return price;
  } catch (e) {
    return 0.0;
  }
}
