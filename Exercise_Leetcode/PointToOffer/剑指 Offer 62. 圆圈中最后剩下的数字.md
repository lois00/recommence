## 剑指 Offer 62. 圆圈中最后剩下的数字
0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

示例 1：
```
输入: n = 5, m = 3
输出: 3
```
示例 2：
```
输入: n = 10, m = 17
输出: 2
```
限制：<br>
    1 <= n <= 10^5 <br>
    1 <= m <= 10^6

## Solutions:
```
class Solution {
/**
   使用ArrayList模拟循环链表（单向的），用mod n来模拟循环的过程。
   假设当前位置是curIndex，那么下一个待删除元素的位置是curIndex+m，
   但是由于删除元素后，所有元素都会向前移动一位，下标需要减一。所以下一个待删除元素的实际位置是curIndex+m-1.
 */

    public static int lastRemaining(int n, int m) {
    	List<Integer> list = new ArrayList<>();
    	//初始化列表
    	for(int i = 0; i < n; i++) {
    		list.add(i);
    	}
    	int curIndex = 0;
    	while(n > 1) {
    		curIndex = (curIndex + m - 1) % n;
    		list.remove(curIndex);
    		n--;
    	}
		return list.get(0);
    }
}
```
执行用时：1059 ms, 在所有 Java 提交中击败了28.68% 的用户<br>
内存消耗：40.9 MB, 在所有 Java 提交中击败了9.34% 的用户