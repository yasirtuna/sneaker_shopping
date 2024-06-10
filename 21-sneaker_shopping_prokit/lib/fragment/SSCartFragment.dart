import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/allcart.g.dart';

import 'package:sneaker_shopping_prokit/screen/SSBillingAddressScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSCartFragment extends StatefulWidget {
  @override
  SSCartFragmentState createState() => SSCartFragmentState();
}

class SSCartFragmentState extends State<SSCartFragment> {
  final Future<List<Allcart>> list = getAllCart();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Cart", style: boldTextStyle()),
      ),
      body: FutureBuilder<List<Allcart>>(
        future: list,
        builder: (BuildContext context, AsyncSnapshot<List<Allcart>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                Allcart item = snapshot.data![index];
                return Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      SSDetailScreen(img: item.img).launch(context);
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
                              image: AssetImage(item.img!),
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
                              item.name!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.subtitle!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.amount!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 14),
                                ),
                                SizedBox(width: 32),
                                Text('x1', style: secondaryTextStyle(size: 14))
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
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Promo code', style: secondaryTextStyle()),
                ),
                Text('NK54T3U', style: boldTextStyle()),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.6)),
                  child: Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey, height: 1),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2items', style: secondaryTextStyle()),
                Text('\$364.00', style: boldTextStyle()),
              ],
            ),
            SizedBox(height: 15),
            sSAppButton(
              context: context,
              onPressed: () {
                SSBillingAddressScreen().launch(context);
              },
              title: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
