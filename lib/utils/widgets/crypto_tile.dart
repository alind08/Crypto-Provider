import 'package:flutter/material.dart';
import 'package:provider_demo/model/crypto_list.dart';
import 'package:provider_demo/utils/decoration/colors.dart';
import 'package:provider_demo/utils/decoration/text_styles.dart';
import 'package:provider_demo/view/crypto_history.dart';

class CryptoTile extends StatelessWidget {
  final Asset? asset;
  const CryptoTile({Key? key,this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (_)=> CryptoHistory(assetId: asset!.id,)
        ));
      },
      child: Card(
        color: darkerGreyColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,12,0,12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      asset!.symbol.toString(),
                    style: kBasicText.copyWith(color: grad4),
                  ),
                  Text(
                    asset!.name.toString(),
                    style: kBasicText.copyWith(color: grad4,fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                  "\$"+double.tryParse(asset!.priceUsd.toString())!.toStringAsFixed(2),
                style: kBasicText.copyWith(
                  color: lightPink,
                  fontSize: 16
                ),
              ),
              // const Spacer(),
              Container(
                margin:const EdgeInsets.only(left: 5),
                height: 30,
                width:70,
                alignment: Alignment.center,
                decoration : BoxDecoration(
                color: double.parse(asset!.changePercent24Hr!) >0? Colors.green:Colors.red
                ),
                child: Text(
                  double.tryParse(asset!.changePercent24Hr.toString())!.toStringAsFixed(2)+"%",
                  style: kBasicText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}