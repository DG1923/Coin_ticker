import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  late List<CoinData> listCoin = [];
  PriceScreen({required this.listCoin});
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int index_item = 0;

  void update_item(int indexNewItem){
    setState(() {
      index_item = indexNewItem;
    });
  }
  Padding cardWidget(String coin, String currency, String exchangeRate){
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Column(
            children: <Widget>[
              Text(
                "1 ${coin} = ${exchangeRate} ${currency}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    CoinData item = widget.listCoin[index_item];
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('🤑 Coin Ticker'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cardWidget("BTC", currenciesList[index_item], item.bTC),
                  cardWidget("ETH", currenciesList[index_item], item.eTH),
                  cardWidget("LTC", currenciesList[index_item], item.lTC),
                ],
              ),
              Container(
                height: 150.0,
                alignment: Alignment.center,
                child: dropDownMenu(updateItem: update_item,selectedItem: index_item,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dropDownMenu extends StatefulWidget {
  final Function(int) updateItem;
  late  int selectedItem;
  dropDownMenu({super.key, required this.updateItem, required this.selectedItem});
  @override
  State<dropDownMenu> createState() => _dropDownMenuState();
}

class _dropDownMenuState extends State<dropDownMenu> {
  List<DropdownMenuItem<int>> getMenuItem() {
    List<DropdownMenuItem<int>> data = [];
    for (int i=0;i< currenciesList.length;i++) {
      var item = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: i,
      );
      data.add(item);
    }
    return data;
  }
  Widget andoridPlatform(){
    return DropdownButton<int>(
        value: widget.selectedItem,
        items: getMenuItem(),
        onChanged: (value) {
          setState(() {
            widget.updateItem(value!);
          });
        });
  }
  Widget iosPlatform(){
    return CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 32,
        onSelectedItemChanged: (value){
          setState(() {
            widget.updateItem(value);
          });
        },
        children: List<Widget>.generate(currenciesList.length,(int index){
          return Center(child: Text(currenciesList[index]),);
        }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid?andoridPlatform():iosPlatform();
  }
}
