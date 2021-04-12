
import 'package:http/http.dart' as http;
import 'package:sanal_kutuphane/model/RoomModel.dart';
import 'dart:async';
import 'dart:convert';

import '../Constants.dart';

class RoomService {

  static String url = Constants.BASE_URL + "/api/room";


  static Future<List<RoomModel>> getAll() async{
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url,headers: header);
      if(response.statusCode==200){
        List<RoomModel> foods=roomModelFromJson(response.body);
        print(foods.toString());
        return foods;
      }
      else{
        print("Hata Oluştu!");
        return List<RoomModel>();
      }
    }
    catch (e){
      print("Hata Oluştu!\n"+e.toString());
      return List<RoomModel>();
    }
  }

  static Future<RoomModel> getById(int id) async{
    try{
      Map<String,String> header={
        "Authorization":"Bearer "+Constants.BEARER_TOKEN,
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.get(url+"/"+id.toString(),headers: header);
      if(response.statusCode==200){
        // print(response.body);
        var jsonResponse = json.decode(response.body);
        RoomModel food= RoomModel.fromJson(jsonResponse);
        return food;
      }
      else{
        print("Hata Oluştu!");
        return RoomModel();
      }
    }
    catch (e){
      print("Hata Oluştu!\n"+e.toString());
      return RoomModel();
    }
  }

}