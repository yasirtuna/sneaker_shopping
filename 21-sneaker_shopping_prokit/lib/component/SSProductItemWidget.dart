import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/component/SSBestODWidget.dart';
import 'package:sneaker_shopping_prokit/model/alldata.g.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

class SSProductItemWidget extends StatelessWidget {
  final Future<List<Alldata>> list = getAllData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Alldata>>(
      future: list,
      builder: (BuildContext context, AsyncSnapshot<List<Alldata>> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
            child: Wrap(
              runSpacing: 16,
              spacing: 16,
              children: snapshot.data!.map((e) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    SSDetailScreen(img: e.img).launch(context);
                  },
                  child: SSBestODWidget(
                    title: e.name,
                    img: e.img,
                    subtitle: e.subtitle,
                    amount: e.amount,
                  ),
                );
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
