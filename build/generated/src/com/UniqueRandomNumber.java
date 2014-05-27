/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;
import java.util.Random;
import java.util.*;
/**
 *
 * @author Administrator
 * generating unique number of random number
 */
public class UniqueRandomNumber {
     static private void generateRandomNumber()
 {
  int rnd;
  Random rand=new Random();
  int[] randNo = new int[10];
  ArrayList numbers =new ArrayList();
  for (int k=0 ; k< 10;k++)
  {
   rnd = rand.nextInt(10) + 1;
   
   if(k==0)
   {
    randNo[0] = rnd;
    numbers.add(randNo[0]);
   }
   else
   {
    while(numbers.contains(rnd))
    {
     rnd = rand.nextInt(10) + 1;
    }
    randNo[k] = rnd;
    numbers.add(randNo[k]);
   }
  }
  System.out.println(numbers);
 }
    public static void main(String s[])
    {
         generateRandomNumber();
    }
    
}
