## 剑指 Offer 38. 字符串的排列

输入一个字符串，打印出该字符串中字符的所有排列。

你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

示例:
```
输入：s = "abc"
输出：["abc","acb","bac","bca","cab","cba"]
```
 
限制：
1 <= s 的长度 <= 8

## Solutions:
```
//回溯法经典应用：深度优先遍历 + 状态重置 + 剪枝
class Solution {
	//由于本题对集合的增删操作比较频繁，使用LinkedList存储结果集，增删速度比较快。
	List<String> result = new LinkedList<>();	
    char[] c;
	
    public String[] permutation(String s) {
    	c = s.toCharArray();
    	dfs(0);		//深度优先遍历
    	return result.toArray(new String[result.size()]);
    }

    public void dfs(int layer) {
    	//递归终止条件：当遍历到最后一层时，得到一种排列方案，然后回退到上一层
    	if(layer == c.length - 1) {
    		result.add(String.valueOf(c));
    		return ;
    	}
    	Set<Character> set = new HashSet<>();
    	for(int i = layer; i < c.length; i++) {
    		//如果这一层已经固定过这个字符，那么就跳过不处理，即“剪枝”。
    		if(set.contains(c[i])) {
    			continue;
    		}
    		set.add(c[i]);	//记录下当前排列方案的每一位固定的字符，为剪枝做准备。
    		swap(i,layer);	//交换c[i]与c[layer]的值，相当于固定第layer位的字符
    		dfs(layer + 1);	//固定第layer位的字符后，进入下一层，继续选择固定字符。
    		swap(layer,i);	//第Layer层至最后一层的字符排列完成后，需要还原交换c[i]与c[layer]的值，即“状态重置”。
    	}
    }
    
    public void swap(int a,int b) {
    	char tmp = c[a];
    	c[a] = c[b];
    	c[b] = tmp;
    }

}
```
执行用时：14 ms, 在所有 Java 提交中击败了55.51% 的用户<br>
内存消耗：44.1 MB, 在所有 Java 提交中击败了43.60% 的用户