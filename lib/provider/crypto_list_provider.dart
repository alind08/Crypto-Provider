import 'package:flutter/material.dart';
import 'package:provider_demo/data/remote/remote_services.dart';
import 'package:provider_demo/model/crypto_history.dart';
import 'package:provider_demo/model/crypto_list.dart';

class CryptoListProvider with ChangeNotifier {
  CryptoList cryptoList = CryptoList();
  CryptoHistory cryptoHistory = CryptoHistory();
  RemoteServices remoteServices = RemoteServices();
  bool loading = false;
  bool historyLoading = false;

  getPostData(context) async {
    loading = true;
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