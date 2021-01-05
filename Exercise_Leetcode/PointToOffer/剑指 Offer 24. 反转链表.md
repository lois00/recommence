## 剑指 Offer 24. 反转链表
定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

示例:
```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```
 
限制：<br>
0 <= 节点个数 <= 5000

## Solutions:
```
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
    	ListNode curNode = head;
    	ListNode reverseNode = null;	//从尾部开始拼接新链表
    	while(curNode != null){
        	ListNode nextNode = curNode.next;
        	curNode.next = reverseNode;
        	reverseNode = curNode;
        	curNode = nextNode;	
    	}
		return reverseNode;
    }
}
```
执行用时：0 ms, 在所有 Java 提交中击败了100.00% 的用户<br>
内存消耗：38.9 MB, 在所有 Java 提交中击败了13.34% 的用户