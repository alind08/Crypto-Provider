class CryptoList {
  List<Asset>? assets;
  int? timestamp;

  CryptoList({this.assets, this.timestamp});

  CryptoList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      assets = [];
      json['data'].forEach((v) {
        assets!.add(Asset.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

}

class Asset {
  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxSupply;
  String? marketCapUsd;
  String? volumeUsd24Hr;
  String? priceUsd;
  String? changePercent24Hr;
  String? vwap24Hr;
  String? explorer;

  Asset(
      {this.id,
        this.rank,
        this.symbol,
        this.name,
        this.supply,
        this.maxSupply,
        this.marketCapUsd,
        this.volumeUsd24Hr,
        this.priceUsd,
        this.changePercent24Hr,
        this.vwap24Hr,
        this.explorer});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    symbol = json['symbol'];
    name = json['name'];
    supply = json['supply'];
    maxSupply = json['maxSupply'];
    marketCapUsd = json['marketCapUsd'];
    volumeUsd24Hr = json['volumeUsd24Hr'];
    priceUsd = json['priceUsd'];
    changePercent24Hr = json['changePercent24Hr'];
    vwap24Hr = json['vwap24Hr'];
    explorer = json['explorer'];
  }

}
