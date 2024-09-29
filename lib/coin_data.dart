import 'InternetHelper.dart';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'INR',
  'JPY',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
];

const List<String> cryptoLists = [
  'BTC',
  'ETH',
  'LTC',
];
const apikey = "a0c3681e-38d6-4040-a89e-d5596ea5344d";
const openUrl = "https://rest.coinapi.io/v1/exchangerate";
class CoinData {
  late String currency;
  late String bTC;
  late String eTH;
  late String lTC;
  CoinData(){
    this.currency = "";
    this.lTC = "";
    this.eTH = "";
    this.bTC = "";
  }
  String toStringData(){
    return "Currency : $currency, BTC: $bTC, ETH: $eTH, LTC: $lTC";
  }
  void saveCurrency(String currency,String bTC,String eTH,String lTC){
    this.currency = currency;
    this.bTC = bTC;
    this.eTH = eTH;
    this.lTC = lTC;
  }
}
class ListCoinData{
  late List<CoinData> CoinList;
  List<CoinData> getListCoinData() => CoinList;
  ListCoinData(){
  }
  void printData(){
    for(int i=0;i<CoinList.length;i++){
      print(CoinList[i].toStringData());
    }
  }
  CoinData getItem(int index){
    return CoinList[index];
  }
  Future getListData() async{
      InternetHelper internetHelper = new InternetHelper();
      CoinList = [];
      for(String i in currenciesList){
        print(i);
        String url = "$openUrl/${i}?filter_asset_id=BTC,ETH,LTC&apikey=$apikey&invert=true";
        var data = await internetHelper.getData(url);
        if(data.toString().isNotEmpty){
          String currency = data["asset_id_base"];
          String btc = double.parse(data["rates"][0]["rate"].toString()).toStringAsFixed(0);
          String eth = double.parse(data["rates"][1]["rate"].toString()).toStringAsFixed(0);
          String ltc = double.parse(data["rates"][2]["rate"].toString()).toStringAsFixed(0);
          print("$currency $btc $eth $ltc");
          CoinData coinData = CoinData();
          coinData.saveCurrency(currency, btc, eth, ltc);
          print(coinData.toStringData());
          CoinList.add(coinData);
        }
      }

  }
}
