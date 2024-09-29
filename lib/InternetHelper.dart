import 'dart:convert';

import 'package:http/http.dart' as http;

class InternetHelper{
  late String _crypto;
  late dynamic _data;
  InternetHelper(){}
  Future<dynamic> getData(String url) async{
    Uri uri =Uri.parse(url);
    print(uri);
    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
      _data = response.body;
      _crypto = response.headers['content-type']!;
      return jsonDecode(_data);
    }else{
      return "";
    }

  }
}
