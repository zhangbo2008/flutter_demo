
#目前已经弄好了购物车抛物线动画.  应该是一些配置文件需要注意,否则会出现动画不动的bug.
所以尽量不要随便修改项目中的配置文件!!!!!!!!!!!!!!!!



void main() {
  runApp(new MyApp());
}








# flutter_mall_cart

指定起点、终点(左右均可)和widget A，将A以抛物线的形式从起点运动到终点（在同一水平线上的话，效果啥样我也不清楚了）。

the function is you can give a start and end point(on left or right its compatible,but not in a horzontal line),and provide a widget.ParabolaAnimateWidget will animate the widget that you provide, from start to end point follow a parabola path.

![image](https://github.com/bladeofgod/throw_cart_demo/blob/master/images/throwInCart.gif)

## INSTALL

dependencies:

  add_cart_parabola: ^0.0.5

## USAGE

看名字差不多就能知道意思，俺就不多写了，具体可以下载demo，里面更为清楚具体。

this a simple tool :), you can realize through this param's name; and clone this demo see more detail.

// rootkey传根部局的可以， 主要用于定位。

// rootkey is your rootWidget's key,it's help for location.

// callback这个是动画的回调，会带会当前动画的status

// callback is animation's status callback,

// controlRatio 控制点的系数，默认是2（小于1可能会有意想不到的效果）

// controlRatio default value is 2 (if it's smaller than 1, maybe cause some effect that you don't wanna see)

ParabolaAnimateWidget(rootKey,startOffset,endOffset,Icon(Icons.cancel,color: Colors.greenAccent,),callback,);

## MORE

如果觉得有啥功能需要加上，可以告诉我，有时间我会加上去（具有通用性的） ，你也可以自己直接修改。

if you have some good thoughts about function, can tell me in there, i will add it soon(it's should be a common functional). 







## CORNER

向大佬学习，嘿嘿！


![image](https://github.com/bladeofgod/throw_cart_demo/blob/master/images/alipay.png)
![image](https://github.com/bladeofgod/throw_cart_demo/blob/master/images/wechat.png)

