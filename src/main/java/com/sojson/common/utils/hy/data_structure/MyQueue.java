package com.sojson.common.utils.hy.data_structure;

/**
 * 通过循环数组实现队列
 * Created by HY on 2017/6/27.
 */
public class MyQueue<E> {
    //数组
    E[] a;
    //初始化数值
    private static final int DEFAULT_SIZE = 10;
    //队列头下标   //(front+1)%a.length
    int front;
    //队列尾下标
    int rear;   //循环队列的下标(rear+1)%a.length

    /**
     * 构造初始化,带参数
     */
    public MyQueue(int size) {
        a = (E[])(new Object[size]);
        System.out.println("a的size="+a.length);
        front = 0;
        rear = 0;
    }
    /**
     * 默认初始化
     */
    public  MyQueue(){
        this(DEFAULT_SIZE);
    }
    /**
     * 入队,判断队列是否满队（rear+1）%(a.length)==front
     */
    public boolean enqueue(E obj){
        if ((rear+1)%(a.length)==front){
            return false;
        }else{
            a[rear] = obj;
            rear=(rear+1)%a.length;
            return true;
        }
    }
    /**
     * 出列，判断是否为空队列 rear==front
     */
    public E dequeue(){
        if(rear==front){
            return null;
        }else{
            E obj =a[front];
            front=(front+1)%a.length;
            return obj;
        }
    }
    /**
     * size
     */
    public int length(){
        if(rear - front>0){
            return (rear-front);
        }else{
            return a.length-(front-rear);
        }
    }


    /**
     * 判断是否为空
     */
    public boolean isEmpty(){
        return rear==front;
    }

    public static void main(String[] args) {

        MyQueue queue = new MyQueue(4);
        queue.enqueue("1");
        queue.enqueue("2");
        queue.enqueue(3);
        queue.enqueue(4);
        queue.enqueue(5);
        queue.enqueue(6);
        System.out.println(queue.length());
        int size = queue.length();
        for (int i=0;i<size;i++){
            System.out.println(queue.dequeue());
        }

//        MyQueue<String> queue=new MyQueue<String>(4);
//        queue.enqueue("1");
//        queue.enqueue("2");
//        queue.enqueue("3");
//        queue.enqueue("4");
//        System.out.println("size="+queue.length());
//        int size=queue.length();
//        System.out.println("*******出栈操作*******");
//        for(int i=0; i<size;i++){
//            System.out.print(queue.dequeue()+" ");
//        }

    }
}
