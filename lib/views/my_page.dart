import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'counter_provider.dart';

class MyPage extends StatefulWidget {
  var item;

  MyPage({
    Key key,
    this.item
  }): super(key: key);
  @override
  @override
  State<StatefulWidget> createState() => MyPageState(item:item);
}

class MyPageState extends State<MyPage> {
  var item;
  RefreshController _refreshController =RefreshController(initialRefresh: false);
  ///初始化CounterProvider
    MyPageState({
      Key key,
      this.item
    });
  CounterProvider _counterProvider = new CounterProvider();

  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');

    //整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (context) => _counterProvider,
      child:
      //child里面的内容不会因为数据的改变而重绘
      Scaffold(
        appBar: AppBar(
          title: Text('my test page'),
        ),
        body: Center(
            child:
            //使用Cousumer来获取Provider
            Column(
              children: <Widget>[

                Flexible( // 在ListView上在包裹一层Flexible
                    child:        SmartRefresher(   // 上下拉动都加载.包上一层上下刷新的组件.
                      enablePullDown: true,
                      enablePullUp: true,
                      header: WaterDropHeader(),

                      footer: CustomFooter(
                          builder: (BuildContext context, LoadStatus mode) {
                            Widget body;
                            if (mode == LoadStatus.idle) {

                            } else if (mode == LoadStatus.loading) {
                              body = CircularProgressIndicator();
                            } else if (mode == LoadStatus.failed) {
                              body = Text("加载失败");
                            } else if (mode == LoadStatus.canLoading) {
                              body = Text("加载更多");
                            } else {
                              body = Text("没有更多");
                            }
                            return Container(
                              height: 50.0,
                              child: Center(child: body),
                            );
                          }
                      ),

                      controller: _refreshController,   // 控制器
                      child:
                      //下面是刷新的内容.组件是一个listview
                      ListView(
//          physics: new NeverScrollableScrollPhysics(),

                          children: <Widget>[
                            Container(
                              height: 500, //让滑动

                              child: Image.network(
                                  item['info']['imgurl']
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.yellow[50]
                              ),
                              padding: EdgeInsets.all(24),
                            ),
                            Container(
                              child: Text(
                                  item['title'],
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context).accentColor
                                  )
                              ),
                              margin: EdgeInsets.fromLTRB(12,12,12,12),
                            ),
                            Text(
                                item['info']['yanyuan']
                            )
                          ]
                        //添加按钮.
                      ),
                    )),









                //使用Consumer来获取CounterProvider，为Text提供数据
                Consumer(builder: (BuildContext context,
                    CounterProvider counterProvider, Widget child) {
                  print('Text1重绘了。。。。。。');

                  return Text(
                    //获取数据
                    'Text1 : ${counterProvider.value}',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                //使用Consumer来获取CounterProvider，为Text提供数据
                Consumer(builder: (BuildContext context,
                    CounterProvider counterProvider, Widget child) {
                  print('Text2重绘了。。。。。。');

                  return Text(
                    //获取数据
                    'Text2 : ${counterProvider.value1}',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                RaisedButton(
                  onPressed: () {
                    print('Button 1被点击了。。。。。。。。。。');
                    _counterProvider.increment();
                  },
                  child: Text('Button1'),
                ),
                RaisedButton(
                  onPressed: () {
                    print('Button 2被点击了。。。。。。。。。。');
                    _counterProvider.increment1();
                  },
                  child: Text('Button2'),
                )
              ],
            )),
      ),
    );
  }
}