import 'dart:developer';
import 'package:provider_demo/model/crypto_history.dart';
import 'package:provider_demo/model/crypto_list.dart';
import 'api_client.dart';

class RemoteServices{

   Future<List<Currency>> getCryptoList() async {
     
    try {
      var  response = await ApiClient.getClient()!.get("");
      log(response.data.runtimeType.toString());
      List<Currency> currencyList = response.data.map<Currency>((i) =>Currency.fromJson(i)).toList();
      return currencyList;
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }


   Future<CryptoHistory> getCryptoHistory(String assetId, String interval) async {
     try {
       var response = await ApiClient.getClient()!.get("assets/$assetId/history?interval=d1");
       var responseObj = CryptoHistory.fromJson(response.data);
       return responseObj;
     } on Exception catch (e) {
       log(e.toString());
       return CryptoHistory();
     }
   }




}