class Counter  {//1  通过with 就可以 调用changenotifier这个类的方法.

  int _count;
  Counter(this._count);

  void add() {
    _count++;
    //2
  }
  get count => _count;//3
}


void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }


//代码必须放main里面
  var a=new Counter(3);
//  print(a);
}


