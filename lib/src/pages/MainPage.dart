import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo1/src/components/MyPagination.dart';
import 'package:flutterdemo1/src/components/MyPaintView.dart';
import 'package:flutterdemo1/src/components/PageIndicator.dart';
import 'package:flutterdemo1/src/utils/AppUtils.dart';

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<AssetImage> imgs = [
    AssetImage('assets/banner1.png'),
    AssetImage('assets/banner2.png'),
    AssetImage('assets/banner3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 720, height: 1280)..init(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Center(
            child: _getTitleView(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/new_xiaoxi_shangse.png'),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: AppUtils.hexToColor('#f5f5f5')),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[_getSwiper(), _getBottomView()],
          ),
        ),
      ),
    );
  }

  /// TitieView
  Widget _getTitleView() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/pos.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Text(
              '上海',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.getInstance().setSp(28)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Image.asset('assets/jiantou_xia.png'),
          )
        ],
      ),
    );
  }

  ///Swiper
  Widget _getSwiper() {
    ///SwiperItem
    Widget _getSwiperItem(BuildContext ctx, int index) {
      return Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                child: Image(
                  image: imgs[index],
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              )));
    }

    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setWidth(300),
              child: Swiper(
                itemBuilder: (BuildContext ctx, int index) {
                  return _getSwiperItem(ctx, index);
                },
                itemCount: 3,
                controller: SwiperController(),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            MyPagination(paddingTop: ScreenUtil.instance.setHeight(20),)
          ],
        ));
  }

  Widget _getBottomView() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10)),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.black12,
                            width: 0.5,
                            style: BorderStyle.solid))),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      '管理公告',
                      style: TextStyle(
                          fontSize: ScreenUtil.instance.setSp(28),
                          color: Colors.black),
                    )
                  ],
                )),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/pos.png'),
                        Expanded(
                          child: Text('zhng sna sddwddwdwd'),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          child: MyPaintView(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
