package com.hy.struct;

/**
 * Created by HY on 2017/7/8.
 */
public class BuddleSort {
    /**
     * 对传入数组进行冒泡排序
     * @param d
     * @return
     */
//    public static int[] sortArray(int[] d){
//        for(int i=0;i<d.length;i++){
//            for(int j=0;j<d.length;j++){
//                if(d[i]>d[j]){
//                    int tem = d[j];
//                    d[j] = d[i];
//                    d[i] = tem;
//                }
//            }
//        }
//        return d;
//    }
    public static int[] sortArray(int[] d){
        for(int i=0;i<d.length;i++){
            for(int j=0;j<d.length-i-1;j++){
                if(d[j+1]>d[j]){
                    int tem = d[j];
                    d[j] = d[j+1];
                    d[j+1] = tem;
                }
            }
        }
        d = reverArrery(d,0,d.length-1);
        return d;
    }
    public static int[] reverArrery(int[] a,int s,int e){
        if(s<e){
            int tem = a[s];
            a[s] = a[e];
            a[e] = tem;
            reverArrery(a,s+1,e-1);
        }

        return a;
    }

    public static void getArray(int[] d){
        for (int i = 0;i<d.length;i++){
            System.out.printf(d[i]+" ");
        }
    }
    public static void main(String[] args) {
        int[] s = {3,2,5,6,1,7,4};
        int[] sorts = sortArray(s);
        getArray(s);
        getArray(sorts);

    }
}
