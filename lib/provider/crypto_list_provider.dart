import 'package:flutter/material.dart';
import 'package:provider_demo/data/remote/remote_services.dart';
import 'package:provider_demo/model/crypto_history.dart';
import 'package:provider_demo/model/crypto_list.dart';

class CryptoListProvider with ChangeNotifier {
  late List<Currency> cryptoList = [];
  CryptoHistory cryptoHistory = CryptoHistory();
  RemoteServices remoteServices = RemoteServices();
  bool loading = false;
  bool historyLoading = false;

   getCryptoList(context) async {
    notifyListeners();
    loading = true;
    cryptoList.clear();
    cryptoList = await remoteServices.getCryptoList();
    loading = false;
    notifyListeners();
  }

  getCryptoHistory(context,String assetId) async {
    historyLoading = true;
    cryptoHistory = await remoteServices.getCryptoHistory(assetId, 'd1');
    historyLoading = false;
    notifyListeners();
  }

}