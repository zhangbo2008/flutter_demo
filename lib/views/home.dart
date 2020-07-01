
import 'package:flutter/material.dart';
import 'package:learn_flutter/api/home.dart';
import 'package:learn_flutter/components/bannerIndex.dart';
import 'package:learn_flutter/components/doubanIndex.dart';

class HomeViews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewsState();
  }

}

class HomeViewsState extends State<HomeViews> {

  List<String> _banners = [];
  List _lists = [];

  getBanner() async {
    List<String> data = await AppHomeApi.getIndexBanners();
    setState(() {
//      print(data);//是图片链接组成的list
      _banners = data;
    });
  }

  getDouBan() async {
    List data = await AppHomeApi.getDouBanApi();
    setState(() {
      _lists = data;
    });
  }

  @override
  initState() {           // 页面首先获取数据放在initState方法里面.
    getBanner();
    getDouBan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          BannerIndexSwiper(  //自己定义的组件.轮播器
            banners: _banners,
          ),
          DouBanIndexComponent(
            lists: _lists,
          )
        ],
      ),
    );
  }

}