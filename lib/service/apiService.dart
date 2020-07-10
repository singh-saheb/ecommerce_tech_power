import 'package:demo_structure/models/fact.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ApiService{

  String _url= "https://thegrowingdeveloper.org/apiview?id=2";
 
  Future<List<Fact>> getFacts() async{
    List<Fact> listOfFacts=[];
    List factsFromResponse=[]; //this list is no longer empty
    Map data;

    http.Response response;
    response = await http.get(_url);
    if(response.statusCode==200){
       data =json.decode(response.body);
       factsFromResponse = data['facts'];
  
       for(int a = 0;a<factsFromResponse.length;a++){
            Fact fact = Fact.fromJson(factsFromResponse[a]); 
            listOfFacts.add(fact);
       }
    }
    return listOfFacts;
  }

}
