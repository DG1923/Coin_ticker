import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'coin_data.dart';

class Loadingdatascreen extends StatefulWidget {
  const Loadingdatascreen({super.key});

  @override
  State<Loadingdatascreen> createState() => _LoadingdatascreenState();
}

class _LoadingdatascreenState extends State<Loadingdatascreen> {
  void getata() async{
    ListCoinData listCoinData = ListCoinData();
    await listCoinData.getListData();
    if(listCoinData.getListCoinData().isEmpty){
      print(" rong");
    }else{
      for(int i = 0 ; i< listCoinData.getListCoinData().length;i++){
        print(listCoinData.getListCoinData()[i]);
      }
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return PriceScreen(listCoin: listCoinData.getListCoinData());
      }));
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getata();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
        ),
      ),
    );
  }
}
