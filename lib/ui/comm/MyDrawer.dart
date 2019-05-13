import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/BookPage.dart';
import 'package:flutter_app/ui/page/ListPage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Gank', style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://thirdwx.qlogo.cn/mmopen/vi_32/jTjqKarzMIpzHibISRqtxKGic430ibXgiaA9rHScQSltqyQjXXtfWWSojWAXxCibnAHYGBiapLJvfrxQFUuDGTwMxZjg/132'),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                child: Icon(Icons.settings, color: Colors.white),
                onTap: () => Navigator.of(context).pushNamed('/setting'),
              )
            ],
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Expanded(
                child: ListView(
                  children: drawerList.map((item) {
                    return ListTile(
                      leading: Icon(item.icon),
                      title: Text(item.title),
                      onTap: () {
                        //关闭侧滑
                        Navigator.of(context).pop();

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          if (item.title == "闲读") {
                            return BookPage();
                          } else {
                            return ListPage(
                              category: item.title,
                            );
                          }
                        }));
                      },
                    );
                  }).toList(),
                ),
              )),
        ],
      ),
    );
  }
}

class DrawerMenuItem {
  final IconData icon;
  final String title;

  const DrawerMenuItem(this.icon, this.title);
}

const List<DrawerMenuItem> drawerList = <DrawerMenuItem>[
  const DrawerMenuItem(Icons.android, 'Android'),
  const DrawerMenuItem(Icons.apps, 'iOS'),
  const DrawerMenuItem(Icons.code, '前端'),
  const DrawerMenuItem(Icons.photo_camera, '福利'),
  const DrawerMenuItem(Icons.video_library, '休息视频'),
  const DrawerMenuItem(Icons.book, '闲读')
];
