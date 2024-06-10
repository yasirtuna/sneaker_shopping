import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/searchmodel.g.dart';
import 'package:sneaker_shopping_prokit/screen/SSProductScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSSearchFragment extends StatelessWidget {
  final Future<List<Searchmodel>> list = getSearchData();

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
        title: Text("Search", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000)),
              decoration: sSInputDecoration(
                context: context,
                name: 'Search',
                icon: Icon(Icons.search,
                    color: Colors.grey.withOpacity(0.7), size: 24),
              ),
            ),
            FutureBuilder<List<Searchmodel>>(
              future: list,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Searchmodel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: InkWell(
                          onTap: () {
                            SSProductScreen(img: snapshot.data![index].img!)
                                .launch(context);
                          },
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Image(
                                image: AssetImage(snapshot.data![index].img!),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              Container(height: 250, color: Colors.black26),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name!,
                                      style: boldTextStyle(
                                          color: Colors.white, size: 12),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                        height: 1,
                                        width: 50,
                                        color: Colors.white),
                                    SizedBox(height: 8),
                                    Text(
                                      snapshot.data![index].subtitle!,
                                      style: boldTextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
