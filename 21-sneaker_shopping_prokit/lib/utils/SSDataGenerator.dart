import 'dart:async';
import 'package:nb_utils/nb_utils.dart';
// import 'package:postgres/postgres.dart';
import 'package:sneaker_shopping_prokit/model/accountmodel.g.dart';
import 'package:sneaker_shopping_prokit/model/allcart.g.dart';
import 'package:sneaker_shopping_prokit/model/alldata.g.dart';
import 'package:sneaker_shopping_prokit/model/favoritemodel.g.dart';
import 'package:sneaker_shopping_prokit/model/paymentmodel.g.dart';
import 'package:sneaker_shopping_prokit/model/productmodel.g.dart';
import 'package:sneaker_shopping_prokit/model/searchmodel.g.dart';
import 'package:sneaker_shopping_prokit/model/selmaprofile.g.dart';
import 'package:sneaker_shopping_prokit/model/shoppingmodel.g.dart';
// import 'package:sneaker_shopping_prokit/utils/dbconnection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var supabase = SupabaseClient('https://bjclmwmzwdgphdooyetj.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqY2xtd216d2RncGhkb295ZXRqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUwNjEzNDYsImV4cCI6MjAzMDYzNzM0Nn0.IqVD6gvEnyLTQ9K4ufrnA2HjuO2BCVFUWnINbln_MII');
Future<List<Selmaprofile>> getOgr() async {
  final response = await supabase
      .from('selmaprofile')
      .select('id,uuid, city, name, address');

  final List<Selmaprofile> finalmodel =
      response.map((item) => Selmaprofile.fromMap(item)).toList();

  return finalmodel;
}

Future<List<Accountmodel>> getAccount() async {
//   //List<AccountModel> list = [];
//   // list.add(AccountModel(name: 'My Order'));
//   // list.add(AccountModel(name: 'Vouchers'));
//   // list.add(AccountModel(name: 'Shopping Address'));
//   // list.add(AccountModel(name: 'FAQ'));
//   // list.add(AccountModel(name: 'Customer Services'));
//   // list.add(AccountModel(name: 'Setting'));

//   // return list;

  // Result results = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM accountmodel", []);

  // List<Accountmodel> accountmodel =
  //     results.map((row) => Accountmodel.fromMap(row.toColumnMap())).toList();

  // return accountmodel;

  final response = await supabase.from('accountmodel').select('id, name');

  final List<Accountmodel> accountmodels =
      response.map((item) => Accountmodel.fromMap(item)).toList();

  return accountmodels;
}

Future<List<Paymentmodel>> paymentList() async {
//   // List<PaymentModel> list = [];
//   // list.add(PaymentModel(name: 'Payment Option', img: 'images/sneakerShopping/ic_payment.png'));
//   // list.add(PaymentModel(name: 'Credit/Debit Card',img: 'images/sneakerShopping/ic_MasterCard.png'));
//   // list.add(PaymentModel(name: 'Paypal', img: 'images/sneakerShopping/ic_paypal.png'));

//   // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM paymentmodel", []);
  // List<Paymentmodel> paymentmodel =
  //     result.map((row) => Paymentmodel.fromMap(row.toColumnMap())).toList();

  // return paymentmodel;

  final response = await supabase.from('paymentmodel').select('id, name, img');

  final List<Paymentmodel> paymentmodels =
      response.map((item) => Paymentmodel.fromMap(item)).toList();

  return paymentmodels;
}

Future<List<Shoppingmodel>> getShopping() async {
//   List<ShoppingModel> list = [];
//   list.add(ShoppingModel(name: 'New Arrival'));
//   list.add(ShoppingModel(name: 'Men'));
//   list.add(ShoppingModel(name: 'Women'));
//   list.add(ShoppingModel(name: 'Kids'));
//   list.add(ShoppingModel(name: 'Sale'));

//   return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM shoppingmodel", []);
  // List<Shoppingmodel> shoppingmodel =
  //     result.map((row) => Shoppingmodel.fromMap(row.toColumnMap())).toList();

  // return shoppingmodel;

  final response = await supabase.from('shoppingmodel').select('id, name');

  final List<Shoppingmodel> shoppingmodels =
      response.map((item) => Shoppingmodel.fromMap(item)).toList();

  return shoppingmodels;
}

Future<List<Productmodel>> getProductData() async {
  // List<ProductModel> list = [];
  // list.add(ProductModel(name: 'All Shoes'));
  // list.add(ProductModel(name: 'Top & T-Shirt'));
  // list.add(ProductModel(name: 'Caps'));
  // list.add(ProductModel(name: 'Accessories'));

  // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM productmodel", []);
  // List<Productmodel> productmodel =
  //     result.map((row) => Productmodel.fromMap(row.toColumnMap())).toList();

  // return productmodel;

  final response = await supabase.from('productmodel').select('id, name, img');

  final List<Productmodel> productmodels =
      response.map((item) => Productmodel.fromMap(item)).toList();

  return productmodels;
}

Future<List<Alldata>> getAllData() async {
  // List<AllData> list = [];
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'Men\'s shoes',img: 'images/sneakerShopping/ic_shoes_5.png',amount: '\$300.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'Women\'s shoes',img: 'images/sneakerShopping/ic_shoes_1.png',amount: '\$200.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'Nike Air Huarache',img: 'images/sneakerShopping/ic_shoes_3.png',amount: '\$250.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'men\'s shoes',img: 'images/sneakerShopping/ic_shoes_4.png',amount: '\$350.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'Nike Air Huarache',img: 'images/sneakerShopping/ic_shoes_5.png',amount: '\$400.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'men\'s shoes',img: 'images/sneakerShopping/ic_shoes_6.png',amount: '\$300.00'));
  // list.add(AllData(name: 'Nike Air VaporMax Evo',subtitle: 'men\'s shoes',img: 'images/sneakerShopping/ic_shoes_8.png',amount: '\$100.00'));

  // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM alldata", []);
  // List<Alldata> alldata =
  //     result.map((row) => Alldata.fromMap(row.toColumnMap())).toList();

  // return alldata;

  final response =
      await supabase.from('alldata').select('id, name, subtitle, img, amount');

  final List<Alldata> alldatas =
      response.map((item) => Alldata.fromMap(item)).toList();

  return alldatas;
}

Future<List<Favoritemodel>> getAllFavorite() async {
  // List<FavoriteModel> list = [];
  // list.add(FavoriteModel(name: 'Nike Air VaporMax Evo',subtitle: 'Men\'s shoes',img: 'images/sneakerShopping/ic_shoes_3.png',amount: '\$300.00'));
  // list.add(FavoriteModel(name: 'Nike Air VaporMax Evo',subtitle: 'Women\'s shoes',img: 'images/sneakerShopping/ic_shoes_10.png',amount: '\$200.00'));
  // list.add(FavoriteModel(name: 'Nike Air VaporMax Evo',subtitle: 'Nike Air Huarache',img: 'images/sneakerShopping/ic_shoes_11.png',amount: '\$250.00'));

  // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM favoritemodel", []);
  // List<Favoritemodel> favoritemodel =
  //     result.map((row) => Favoritemodel.fromMap(row.toColumnMap())).toList();

  // return favoritemodel;

  final response = await supabase
      .from('favoritemodel')
      .select('id, name, subtitle, img, amount');

  final List<Favoritemodel> favoritemodels =
      response.map((item) => Favoritemodel.fromMap(item)).toList();

  return favoritemodels;
}

Future<List<Allcart>> getAllCart() async {
  // List<AllCart> list = [];
  // list.add(AllCart(name: 'Nike Air VaporMax Evo',subtitle: 'Men\'s shoes',img: 'images/sneakerShopping/ic_shoes_11.png',amount: '\$300.00'));
  // list.add(AllCart(name: 'Nike Air VaporMax Evo',subtitle: 'Women\'s shoes',img: 'images/sneakerShopping/ic_shoes_4.png',amount: '\$200.00'));
  // list.add(AllCart(name: 'Nike Air VaporMax Evo',subtitle: 'Nike Air Huarache',img: 'images/sneakerShopping/ic_shoes_1.png',amount: '\$250.00'));

  // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM allcart", []);
  // List<Allcart> allcart =
  //     result.map((row) => Allcart.fromMap(row.toColumnMap())).toList();

  // return allcart;

  final response =
      await supabase.from('allcart').select('id, name, subtitle, img, amount');

  final List<Allcart> allcarts =
      response.map((item) => Allcart.fromMap(item)).toList();

  return allcarts;
}

Future<List<Searchmodel>> getSearchData() async {
  // List<SearchModel> list = [];
  // list.add(SearchModel(name: 'Top & T-Shirt Collection',subtitle: '25% OFF',img: 'images/sneakerShopping/ic_arrivals_4.jpg'));
  // list.add(SearchModel(name: 'Top & T-Shirt Collection',subtitle: '30% OFF',img: 'images/sneakerShopping/ic_arrivals_2.jpg'));
  // list.add(SearchModel(name: 'Top & T-Shirt Collection',subtitle: '70% OFF',img: 'images/sneakerShopping/ic_arrivals_3.jpg'));
  // list.add(SearchModel(name: 'Top & T-Shirt Collection',subtitle: '55% OFF',img: 'images/sneakerShopping/ic_arrivals_4.jpg'));
  // list.add(SearchModel(name: 'Top & T-Shirt Collection',subtitle: '35% OFF',img: 'images/sneakerShopping/ic_arrivals_5.jpg'));

  // return list;

  // Result result = await PostgresDbConnection.executeQueryWithParams(
  //     "SELECT * FROM searchmodel", []);
  // List<Searchmodel> searchmodel =
  //     result.map((row) => Searchmodel.fromMap(row.toColumnMap())).toList();

  // return searchmodel;

  final response =
      await supabase.from('searchmodel').select('id, name, subtitle, img');

  final List<Searchmodel> searchmodels =
      response.map((item) => Searchmodel.fromMap(item)).toList();

  return searchmodels;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ];
}
