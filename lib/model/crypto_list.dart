
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
    oneD = json['1d'] != null ? OneD.fromJson(json['1d']) : null;
    thirtyD =
        json['30d'] != null ? OneD.fromJson(json['30d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['name'] = name;
    data['logo_url'] = logoUrl;
    data['status'] = status;
    data['price'] = price;
    data['price_date'] = priceDate;
    data['price_timestamp'] = priceTimestamp;
    data['circulating_supply'] = circulatingSupply;
    data['max_supply'] = maxSupply;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['num_exchanges'] = numExchanges;
    data['num_pairs'] = numPairs;
    data['num_pairs_unmapped'] = numPairsUnmapped;
    data['first_candle'] = firstCandle;
    data['first_trade'] = firstTrade;
    data['first_order_book'] = firstOrderBook;
    data['rank'] = rank;
    data['rank_delta'] = rankDelta;
    data['high'] = high;
    data['high_timestamp'] = highTimestamp;
    data['1d'] = oneD!.toJson();
    data['30d'] = thirtyD!.toJson();
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
    data['volume'] = volume;
    data['price_change'] = priceChange;
    data['price_change_pct'] = priceChangePct;
    data['volume_change'] = volumeChange;
    data['volume_change_pct'] = volumeChangePct;
    data['market_cap_change'] = marketCapChange;
    data['market_cap_change_pct'] = marketCapChangePct;
    return data;
  }
}

