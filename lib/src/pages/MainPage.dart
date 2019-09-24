import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[_getSwiper()],
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
    return Container(
        height: ScreenUtil.instance.setHeight(280),
        child: Swiper(
          itemBuilder: (BuildContext ctx, int index) {
            return _getSwiperItem(ctx, index);
          },
          itemCount: 3,
          pagination:SwiperPagination(),
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }

  Widget _getSwiperItem(BuildContext ctx, int index) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: ClipRRect(
            child: Image(
                image: imgs[index],
                width: ScreenUtil.instance.setWidth(720),
//                height: ScreenUtil.instance.setHeight(280),
                fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(8),
          )

        ));
  }
}