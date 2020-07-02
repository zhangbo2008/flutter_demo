// 购买按钮.

Container(
alignment: Alignment.bottomRight, // 这个参数非常重要,对齐直接就弄到左右了.
padding: EdgeInsets.all(20),//内部padding也很重要.
width: 10,
child: FloatingActionButton(
onPressed: (){print(111111);},
child: Text('购买'),
),
margin: EdgeInsets.fromLTRB(0,0,0,10), //margin经常没用.
),