import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/shoppingmodel.g.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

import '../../../main.dart';

class SSShoppingScreen extends StatelessWidget {
  final Future<List<Shoppingmodel>> list = getShopping();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
          height: 30,
          width: 30,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.clear, color: context.iconColor, size: 20),
        ),
      ),
      body: FutureBuilder<List<Shoppingmodel>>(
        future: list,
        builder: (BuildContext context,
            AsyncSnapshot<List<Shoppingmodel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      snapshot.data![index].name!,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
