import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:productbox/model/fetchusers.dart';

class FetchUsers {
  var result;
  Random random = Random();
  Users? my;
  Future<Users?> getusers() async {
    var request = http.Request(
        'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));

    http.StreamedResponse response = await request.send();

    int randomNumber = random.nextInt(9) + 1;

    // Returns a random user using random id from 1-10!
    if (response.statusCode == 200) {
      result = jsonDecode(await response.stream.bytesToString());
      my = Users.fromJson(result[randomNumber]);
    } else {
      print(response.reasonPhrase);
    }
    return my ?? null;
  }
}
