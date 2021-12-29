class CryptoHistory {
  List<Data>? data;
  int? timestamp;

  CryptoHistory({this.data, this.timestamp});

  CryptoHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  String? priceUsd;
  int? time;

  Data({this.priceUsd, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    priceUsd = json['priceUsd'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['priceUsd'] = priceUsd;
    data['time'] = time;
    return data;
  }
}