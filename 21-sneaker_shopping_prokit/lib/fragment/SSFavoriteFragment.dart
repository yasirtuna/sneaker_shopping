import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/favoritemodel.g.dart';

import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

class SSFavoriteFragment extends StatelessWidget {
  final Future<List<Favoritemodel>> list = getAllFavorite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("WishList", style: boldTextStyle()),
      ),
      body: FutureBuilder<List<Favoritemodel>>(
        future: list,
        builder: (BuildContext context,
            AsyncSnapshot<List<Favoritemodel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      SSDetailScreen(img: snapshot.data![index].img)
                          .launch(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white12, width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(snapshot.data![index].img!),
                              height: 80,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 16, width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              snapshot.data![index].name!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(),
                            ),
                            SizedBox(height: 4),
                            Text(
                              snapshot.data![index].subtitle!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  snapshot.data![index].amount!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 14),
                                ),
                                SizedBox(height: 16, width: 16),
                                Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xa9ffffff),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(160.0),
                                    border: Border.all(
                                      color: Color(0xed000000),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Align(
                                      alignment: Alignment(0.0, -0.1),
                                      child: Text(
                                        "Buy Now",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
