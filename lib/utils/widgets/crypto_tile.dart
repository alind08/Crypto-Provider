import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_demo/model/crypto_list.dart';
import 'package:provider_demo/utils/decoration/colors.dart';
import 'package:provider_demo/utils/decoration/text_styles.dart';
import 'package:provider_demo/view/crypto_history.dart';

class CryptoTile extends StatelessWidget {
  final Currency? currency;
  const CryptoTile({Key? key, this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CryptoHistory(
                      assetId: currency!.id,
                    )));
      },
      child: Card(
        color: darkerGreyColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.network(currency!.logoUrl.toString()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: ImageWidget(imageUrl: currency!.logoUrl.toString()),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency!.symbol.toString(),
                    style: kBasicText.copyWith(color: grad4),
                  ),
                  Text(
                    currency!.name.toString(),
                    style: kBasicText.copyWith(color: grad4, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "\$" +
                    double.tryParse(currency!.price.toString())!
                        .toStringAsFixed(2),
                style: kBasicText.copyWith(color: lightPink, fontSize: 16),
              ),
              // const Spacer(),
              // Container(
              //   margin:const EdgeInsets.only(left: 5),
              //   height: 30,
              //   width:70,
              //   alignment: Alignment.center,
              //   decoration : BoxDecoration(
              //   color: double.parse(asset!.changePercent24Hr!) >0? Colors.green:Colors.red
              //   ),
              //   child: Text(
              //     double.tryParse(asset!.changePercent24Hr.toString())!.toStringAsFixed(2)+"%",
              //     style: kBasicText,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(imageUrl.split('.').last.toLowerCase().contains('svg')){
      return SvgPicture.network(
          imageUrl,
          placeholderBuilder: (BuildContext context) => Container(
              height: 20,
              width: 20,
              child: const Center(child: CircularProgressIndicator(strokeWidth: 0.7,))),
        );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>  Container(
        height: 20,
        width: 20,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 0.7,))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
