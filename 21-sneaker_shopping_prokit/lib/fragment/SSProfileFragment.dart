import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/accountmodel.g.dart';
import 'package:sneaker_shopping_prokit/model/selmaprofile.g.dart';
import 'package:sneaker_shopping_prokit/utils/SSColors.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SSProfileFragment extends StatefulWidget {
  @override
  State<SSProfileFragment> createState() => _SSProfileFragmentState();
}

class _SSProfileFragmentState extends State<SSProfileFragment> {
  final Future<List<Accountmodel>> data = getAccount();
  final Future<List<Selmaprofile>> ogr = getOgr();

  Future<String?> _fetchUserEmail() async {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("My Account", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image(
                        image: AssetImage(
                            'images/sneakerShopping/ic_arrivals_1.jpg'),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2, -0.2),
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff000000),
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1)),
                    child: Icon(Icons.edit, color: Color(0xffffffff), size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16, width: 16),
            FutureBuilder<String?>(
              future: _fetchUserEmail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(
                    snapshot.data ?? 'No email found',
                    style: primaryTextStyle(),
                  );
                }
              },
            ),
            FutureBuilder<List<Selmaprofile>>(
              future: ogr,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final item = snapshot.data!.first;
                  return Text(
                    'Name: ${item.name}\nAddress: ${item.address}\nCity: ${item.city}\nUuid: ${item.uuid}',
                    style: primaryTextStyle(),
                  );
                } else {
                  return Text('No data found');
                }
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                settingWidget(title: '0', subtitle: 'Processing'),
                Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: 16)),
                settingWidget(title: '1', subtitle: 'Shipped'),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.only(bottom: 16),
                ),
                settingWidget(title: '0', subtitle: 'Pickup'),
              ],
            ),
            SizedBox(height: 16),
            FutureBuilder<List<Accountmodel>>(
              future: data,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Accountmodel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(snapshot.data![index].name!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: boldTextStyle(size: 16)),
                                Icon(Icons.arrow_forward_ios,
                                    color: context.iconColor, size: 17),
                              ],
                            ),
                            SizedBox(height: 8, width: 16),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                              height: 16,
                              thickness: 0,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DarkMode', style: boldTextStyle(size: 16)),
                Switch(
                  value: appStore.isDarkModeOn,
                  activeColor: appColorPrimary,
                  onChanged: (s) {
                    appStore.toggleDarkMode(value: s);
                  },
                )
              ],
            ).onTap(() {
              appStore.toggleDarkMode();
            }),
            SizedBox(height: 8, width: 16),
            Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 16,
                thickness: 0,
                indent: 0,
                endIndent: 0),
          ],
        ),
      ),
    );
  }
}
