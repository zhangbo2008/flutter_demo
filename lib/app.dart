import 'package:flutter/material.dart';
import 'package:learn_flutter/views/abouts.dart';
import 'package:learn_flutter/views/home.dart';
import 'package:learn_flutter/views/product.dart';
import 'package:learn_flutter/views/lists.dart';
import 'package:learn_flutter/views/my.dart';
import 'package:learn_flutter/views/shopCar.dart';
import 'package:provider/provider.dart';
/*这个app.dart控制的是主页面.*/              //所以把变量都存这里面.
import 'config/const.dart';



//数据model也放这里.
class MyModel with ChangeNotifier{
  //                                               <--- MyModel
  MyModel({this.counter = 0});

  int counter = 0;

  incrementCounter()  {

    counter++;
    print(counter);
    notifyListeners();
  }
}

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ApplicationState();
  }

}

class ApplicationState extends State<Application> {

  List<Widget> PageViews = [
    HomeViews(),
    ProductViews(),
//    ListDemoViews(),
    AboutDemoViews(),
    myViews3(),
    myViews2(),

  ];

  int _currentIndex = 3;

  Widget _currentPage() {
    return PageViews[_currentIndex];
  }

  void changeBottomBar(int index) {
    if ((index + 1) > PageViews.length) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MyModel(), // 这里面写所有被监听的全局变量.



    child:Scaffold(
      appBar: AppBar(
        title: Text(ConstKey.title),
        elevation: 8,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) { // 这个来控制这些按钮的相应.
          changeBottomBar(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('产品'),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text('列表展示'),
//          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.system_update),
            title: Text('关于我们'),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text('购物车'),
          ),
    BottomNavigationBarItem(
    icon: Icon(Icons.account_box),
    title: Text('我的')),
        ]
      ),
      body: _currentPage()
    ));
  }

}