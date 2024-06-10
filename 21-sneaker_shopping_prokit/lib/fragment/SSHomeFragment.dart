import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/component/SSBestODWidget.dart';
import 'package:sneaker_shopping_prokit/model/alldata.g.dart';
import 'package:sneaker_shopping_prokit/model/searchmodel.g.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSViewAllScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../../../main.dart';

class SSHomeFragment extends StatefulWidget {
  @override
  State<SSHomeFragment> createState() => _SSHomeFragmentState();
}

class _SSHomeFragmentState extends State<SSHomeFragment> {
  final Future<List<Alldata>> list = getAllData();
  final Future<List<Searchmodel>> data = getSearchData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(() {
      dialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(
          image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
          height: 30,
          width: 30,
          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          fit: BoxFit.cover,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Responsive(
              web: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Image(
                  image: AssetImage('images/sneakerShopping/ic_banner1.jpg'),
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              mobile: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Image(
                  image: AssetImage('images/sneakerShopping/ic_banner1.jpg'),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Best of OD",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(),
                  ),
                  TextButton(
                    onPressed: () {
                      SSViewAllScreen().launch(context);
                    },
                    child: Text("Show all", style: secondaryTextStyle()),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Alldata>>(
              future: list,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Alldata>> snapshot) {
                if (snapshot.hasData) {
                  return HorizontalList(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          SSDetailScreen(img: snapshot.data![index].img)
                              .launch(context);
                        },
                        child: SSBestODWidget(
                          title: snapshot.data![index].name,
                          img: snapshot.data![index].img,
                          subtitle: snapshot.data![index].subtitle,
                          amount: snapshot.data![index].amount,
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
            SizedBox(height: 16, width: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                "New Arrivals",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(),
              ),
            ),
            Responsive(
              mobile: FutureBuilder<List<Searchmodel>>(
                future: data,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Searchmodel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return arrivalWidget(
                            context: context, img: snapshot.data![index].img);
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: 300,
            width: 300,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image(
                      image: AssetImage(
                          'images/sneakerShopping/ic_arrivals_2.jpg'),
                      height: 200,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(Icons.close, color: Colors.black),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(16),
                  width: context.width(),
                  color: context.cardColor,
                  child: sSAppButton(
                    textColor: Colors.white,
                    title: 'Shop Now',
                    context: context,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
