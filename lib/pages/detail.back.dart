
import 'package:flutter/material.dart';

class CatDetailPage extends StatefulWidget {

  var item;

  CatDetailPage({
    Key key,
    this.item
  }): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CatDetailPageState(item: item);
  }

}

class CatDetailPageState extends State<CatDetailPage> {

  CatDetailPageState({
    Key key,
    this.item
  });

  var item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),


      body:

      Container(
      child:


      Container(
        child: ListView(
//          physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              height: 1000, //让滑动

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
            ),
            ListView(

                physics: new NeverScrollableScrollPhysics(),
                children:<Widget>[ Text(
    '1111111111111111111111'
            )]

        )










          ],


          //添加按钮.










        ),



      ),)
    );
  }

}