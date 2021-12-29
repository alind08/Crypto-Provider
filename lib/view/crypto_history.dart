// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_demo/model/crypto_history.dart';
// import 'package:provider_demo/provider/crypto_list_provider.dart';
// import 'package:provider_demo/utils/decoration/colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class CryptoHistory extends StatefulWidget {
//   final String? assetId;
//   const CryptoHistory({Key? key,this.assetId}) : super(key: key);
//
//   @override
//   _CryptoHistoryState createState() => _CryptoHistoryState();
// }
//
// class _CryptoHistoryState extends State<CryptoHistory> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final cryptoProvider = Provider.of<CryptoListProvider>(context, listen: false);
//     cryptoProvider.getCryptoHistory(context,widget.assetId.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cryptoProvider = Provider.of<CryptoListProvider>(context);
//     // if(!cryptoProvider.historyLoading){
//     //   for(int i = 0; i<cryptoProvider.cryptoHistory.data!.length;i++){
//     //     var time = DateTime.fromMicrosecondsSinceEpoch(1000*int.parse(cryptoProvider.cryptoHistory.data![i].time.toString()));
//     //     String formattedDate = DateFormat('yyyy,MM,dd').format(time);
//     //     print(formattedDate);
//     //   }
//     // }


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model/crypto_history.dart';
import 'package:provider_demo/provider/crypto_list_provider.dart';
import 'package:provider_demo/utils/decoration/colors.dart';
import 'package:provider_demo/utils/decoration/text_styles.dart';

class CryptoHistory extends StatefulWidget {
  final String? assetId;
  const CryptoHistory({Key? key,this.assetId}) : super(key: key);

  @override
  _CryptoHistoryState createState() => _CryptoHistoryState();
}

class _CryptoHistoryState extends State<CryptoHistory> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cryptoProvider = Provider.of<CryptoListProvider>(context, listen: false);
    cryptoProvider.getCryptoHistory(context,widget.assetId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final cryptoProvider = Provider.of<CryptoListProvider>(context);
    return Scaffold(
      backgroundColor: mellowColor ,
      appBar: AppBar(
        backgroundColor: mellowColor,
        title: const Text("Home",style: TextStyle(color: mintGreen),),
      ),
      body: cryptoProvider.historyLoading?
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
            child: CircularProgressIndicator()
        ),
      ):cryptoProvider.cryptoHistory.data != null?
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Color(0xff232d37)),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 18.0, left: 12.0, top: 24, bottom: 12),
          child: LineChart(
            mainData(cryptoProvider.cryptoHistory.data),
          ),
        ),
      ):SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("Request limit reached!",style: kBasicText,),
        ),
      ),
    );
  }

  LineChartData mainData(List<Data>? cryptoHistoryData) {
    List<FlSpot> mySpots = [];
    int myLength = cryptoHistoryData!.length > 20?20:cryptoHistoryData.length;
    for(int i= 0;i<cryptoHistoryData.length;i++){
      DateTime time = DateTime.fromMicrosecondsSinceEpoch(1000*int.parse(cryptoHistoryData[i].time.toString()));
      mySpots.add(FlSpot(time.month.toDouble(),double.parse(cryptoHistoryData[i].priceUsd!)));
    }
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'J';
              case 2:
                return 'F';
              case 3:
                return 'M';
              case 4:
                return 'A';
              case 5:
                return 'M';
              case 6:
                return 'J';
              case 7:
                return 'J';
              case 8:
                return 'A';
              case 9:
                return 'S';
              case 10:
                return 'O';
              case 11:
                return 'N';
              case 12:
                return 'D';

            }
            return '$value';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            // switch (value.toInt()) {
            //   case 1:
            //     return '10k';
            //   case 3:
            //     return '30k';
            //   case 5:
            //     return '50k';
            // }
            return '$value';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: mySpots,
         // const [
            // FlSpot(0, 3),
            // FlSpot(1, 6),
            // FlSpot(2, 9),
            // FlSpot(0, 3),
            // FlSpot(2.6, 2),
            // FlSpot(4.9, 5),
            // FlSpot(6.8, 3.1),
            // FlSpot(8, 4),
            // FlSpot(9.5, 3),
            // FlSpot(11, 4),
         // ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
