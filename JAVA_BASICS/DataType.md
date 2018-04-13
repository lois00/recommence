示例：<br>
```
byte a1 = 2, a2 = 4, a3;
short s = 16;
a2 = s;
a3 = a1 * a2;
```
第三行和第四行会报错。原因：<br>
1、short类型转为byte类型出错<br>
2、a1乘以a2结果为int类型，转为byte类型出错。<br>
数值型变量在默认情况下为Int型，byte和short型在计算时会自动转换为int型计算，结果也是int 型。所以a1乘以a2的结果是int 型的。<br>

byte+byte=int，低级向高级是隐式类型转换，高级向低级必须强制类型转换，byte<char<short<int<long<float<double
