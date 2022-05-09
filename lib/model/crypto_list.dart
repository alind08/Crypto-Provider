// class CryptoList {
//   List<Asset>? assets;
//   int? timestamp;

//   CryptoList({this.assets, this.timestamp});

  // CryptoList.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     assets = [];
  //     json['data'].forEach((v) {
  //       assets!.add(Asset.fromJson(v));
  //     });
  //   }
  //   timestamp = json['timestamp'];
  // }

// }

// class Asset {
//   String? id;
//   String? rank;
//   String? symbol;
//   String? name;
//   String? supply;
//   String? maxSupply;
//   String? marketCapUsd;
//   String? volumeUsd24Hr;
//   String? priceUsd;
//   String? changePercent24Hr;
//   String? vwap24Hr;
//   String? explorer;

//   Asset(
//       {this.id,
//         this.rank,
//         this.symbol,
//         this.name,
//         this.supply,
//         this.maxSupply,
//         this.marketCapUsd,
//         this.volumeUsd24Hr,
//         this.priceUsd,
//         this.changePercent24Hr,
//         this.vwap24Hr,
//         this.explorer});

//   Asset.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     rank = json['rank'];
//     symbol = json['symbol'];
//     name = json['name'];
//     supply = json['supply'];
//     maxSupply = json['maxSupply'];
//     marketCapUsd = json['marketCapUsd'];
//     volumeUsd24Hr = json['volumeUsd24Hr'];
//     priceUsd = json['priceUsd'];
//     changePercent24Hr = json['changePercent24Hr'];
//     vwap24Hr = json['vwap24Hr'];
//     explorer = json['explorer'];
//   }

// }


class Currency {
  String? id;
  String? currency;
  String? symbol;
  String? name;
  String? logoUrl;
  String? status;
  String? price;
  String? priceDate;
  String? priceTimestamp;
  String? circulatingSupply;
  String? maxSupply;
  String? marketCap;
  String? marketCapDominance;
  String? numExchanges;
  String? numPairs;
  String? numPairsUnmapped;
  String? firstCandle;
  String? firstTrade;
  String? firstOrderBook;
  String? rank;
  String? rankDelta;
  String? high;
  String? highTimestamp;
  OneD? oneD;
  OneD? thirtyD;

  Currency(
      {this.id,
      this.currency,
      this.symbol,
      this.name,
      this.logoUrl,
      this.status,
      this.price,
      this.priceDate,
      this.priceTimestamp,
      this.circulatingSupply,
      this.maxSupply,
      this.marketCap,
      this.marketCapDominance,
      this.numExchanges,
      this.numPairs,
      this.numPairsUnmapped,
      this.firstCandle,
      this.firstTrade,
      this.firstOrderBook,
      this.rank,
      this.rankDelta,
      this.high,
      this.highTimestamp,
      this.oneD,
      this.thirtyD});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    symbol = json['symbol'];
    name = json['name'];
    logoUrl = json['logo_url'];
    status = json['status'];
    price = json['price'];
    priceDate = json['price_date'];
    priceTimestamp = json['price_timestamp'];
    circulatingSupply = json['circulating_supply'];
    maxSupply = json['max_supply'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    numExchanges = json['num_exchanges'];
    numPairs = json['num_pairs'];
    numPairsUnmapped = json['num_pairs_unmapped'];
    firstCandle = json['first_candle'];
    firstTrade = json['first_trade'];
    firstOrderBook = json['first_order_book'];
    rank = json['rank'];
    rankDelta = json['rank_delta'];
    high = json['high'];
    highTimestamp = json['high_timestamp'];
    oneD = json['1d'] != null ? new OneD.fromJson(json['1d']) : null;
    thirtyD =
        json['30d'] != null ? new OneD.fromJson(json['30d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['status'] = this.status;
    data['price'] = this.price;
    data['price_date'] = this.priceDate;
    data['price_timestamp'] = this.priceTimestamp;
    data['circulating_supply'] = this.circulatingSupply;
    data['max_supply'] = this.maxSupply;
    data['market_cap'] = this.marketCap;
    data['market_cap_dominance'] = this.marketCapDominance;
    data['num_exchanges'] = this.numExchanges;
    data['num_pairs'] = this.numPairs;
    data['num_pairs_unmapped'] = this.numPairsUnmapped;
    data['first_candle'] = this.firstCandle;
    data['first_trade'] = this.firstTrade;
    data['first_order_book'] = this.firstOrderBook;
    data['rank'] = this.rank;
    data['rank_delta'] = this.rankDelta;
    data['high'] = this.high;
    data['high_timestamp'] = this.highTimestamp;
    if (this.oneD != null) {
      data['1d'] = this.oneD!.toJson();
    }
    if (this.thirtyD != null) {
      data['30d'] = this.thirtyD!.toJson();
    }
    return data;
  }
}

class OneD {
  String? volume;
  String? priceChange;
  String? priceChangePct;
  String? volumeChange;
  String? volumeChangePct;
  String? marketCapChange;
  String? marketCapChangePct;

  OneD(
      {this.volume,
      this.priceChange,
      this.priceChangePct,
      this.volumeChange,
      this.volumeChangePct,
      this.marketCapChange,
      this.marketCapChangePct});

  OneD.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    priceChange = json['price_change'];
    priceChangePct = json['price_change_pct'];
    volumeChange = json['volume_change'];
    volumeChangePct = json['volume_change_pct'];
    marketCapChange = json['market_cap_change'];
    marketCapChangePct = json['market_cap_change_pct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volume'] = this.volume;
    data['price_change'] = this.priceChange;
    data['price_change_pct'] = this.priceChangePct;
    data['volume_change'] = this.volumeChange;
    data['volume_change_pct'] = this.volumeChangePct;
    data['market_cap_change'] = this.marketCapChange;
    data['market_cap_change_pct'] = this.marketCapChangePct;
    return data;
  }
}

