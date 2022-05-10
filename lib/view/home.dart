import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model/crypto_list.dart';
import 'package:provider_demo/provider/crypto_list_provider.dart';
import 'package:provider_demo/utils/decoration/colors.dart';
import 'package:provider_demo/utils/decoration/text_styles.dart';
import 'package:provider_demo/utils/widgets/crypto_tile.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late CryptoListProvider cryptoProvider;
  List<Currency> currecies = <Currency>[];
  late CryptodataSource cryptodataSource;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => context.read<CryptoListProvider>().getCryptoList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mellowColor,
      appBar: AppBar(
        backgroundColor: mellowColor,
        title: const Text(
          "Home",
          style: TextStyle(color: mintGreen),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Future.microtask(
            () => context.read<CryptoListProvider>().getCryptoList(context),
          );
        },
        child:
            Consumer<CryptoListProvider>(builder: (context, notifier, child) {
          if (notifier.loading) {
            return const Center(
              child: CircularProgressIndicator(
                key: Key('progress-indicator'),
              ),
            );
          }
          if (notifier.cryptoList.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Request limit reached!",
                  style: kBasicText,
                ),
              ),
            );
          }
          currecies = notifier.cryptoList;
          cryptodataSource = CryptodataSource(currencyList: currecies);
          return SfDataGrid(
            source: cryptodataSource,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'ID',
                        style: kBasicText.copyWith(color: grad4),
                      ))),
              GridColumn(
                  columnName: 'name',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Name',
                        style: kBasicText.copyWith(color: grad4),
                      ))),
              GridColumn(
                  columnName: 'rank',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Rank',
                        overflow: TextOverflow.ellipsis,
                        style: kBasicText.copyWith(color: grad4),
                      ))),
              GridColumn(
                  columnName: 'price',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Price',
                        style: kBasicText.copyWith(color: Colors.white),
                      ))),
            ],
          );
          // return ListView.builder(
          //   itemBuilder: (context, i) {
          //     return CryptoTile(
          //       currency: notifier.cryptoList[i],
          //     );
          //   },
          //   itemCount: notifier.cryptoList.length,
          // );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: grad1,
        onPressed: () {
          // cryptoProvider.getCryptoList(context);
          Future.microtask(
            () => context.read<CryptoListProvider>().getCryptoList(context),
          );
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CryptodataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  CryptodataSource({required List<Currency> currencyList}) {
    _employeeData = currencyList
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'id', value: "${e.logoUrl}*${e.id}"),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'rank', value: e.rank),
              DataGridCell<String>(
                columnName: 'price',
                value: e.price,
              )
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName.contains('id')) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: SizedBox(
              height: 25,
              width: 25,
              child: ImageWidget(imageUrl: e.value.split('*').first),
            ),
          ),
          Text(e.value.split('*').last),
        ]);
      }
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
