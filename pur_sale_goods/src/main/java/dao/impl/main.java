package dao.impl;

import java.util.Arrays;
import java.util.HashMap;

public class main {
  
  
  public static void main(String[] args) {
    String s = "aaa";//nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
    String ss = "1+-1i";
    int[] nums1 = {1, 3, 2, 4, 1};
    int[] nums2 = Arrays.copyOfRange(nums1, 1, 4);
    
    
    HashMap<Character, Integer> hm = new HashMap<>();
    int q[][] = {{2, 33}, {4, 5}};
    int l = minPairSum(nums1);
    System.out.println(l);
    
    
  }
  
  public static int minPairSum(int[] nums) {
    Arrays.sort(nums);
    int max = 0;
    for (int i = 0; i < nums.length / 2; i++) {
      if (nums[i] + nums[nums.length - i] > max) {
        max = nums[i] + nums[nums.length - i];
      }
    }
    return max;
  }
}




