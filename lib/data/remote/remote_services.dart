import 'dart:developer';
import 'package:provider_demo/model/crypto_history.dart';
import 'package:provider_demo/model/crypto_list.dart';
import 'api_client.dart';

class RemoteServices{

   Future<CryptoList> getCryptoList() async {
    try {
      var response = await ApiClient.getClient()!.get("assets");
      var responseObj = CryptoList.fromJson(response.data);
      return responseObj;
    } on Exception catch (e) {
      log(e.toString());
      return CryptoList();
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