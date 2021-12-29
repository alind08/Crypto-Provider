import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/crypto_list_provider.dart';
import 'package:provider_demo/utils/decoration/colors.dart';
import 'package:provider_demo/utils/decoration/text_styles.dart';
import 'package:provider_demo/utils/widgets/crypto_tile.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cryptoProvider = Provider.of<CryptoListProvider>(context, listen: false);
    cryptoProvider.getPostData(context);
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
      body: cryptoProvider.loading?SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: CircularProgressIndicator()
        ),
      ):
      cryptoProvider.cryptoList.assets !=null? ListView.builder(
        itemBuilder: (context,i){
          return CryptoTile(
            asset: cryptoProvider.cryptoList.assets![i],
          );
        },
        itemCount: cryptoProvider.cryptoList.assets!.length,
      ):SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("Request limit reached!",style: kBasicText,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: grad1,
        onPressed: (){
          cryptoProvider.getPostData(context);
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
