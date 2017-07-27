package com.sojson.client;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.*;

/**
 * Created by HY on 2017/7/3.
 */
public class TestDemo extends  Thread{

    public static void main(String[] args) {
        TestDemo td = new TestDemo();
        td.start();
        try {
            td.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(21);


    }


    @Override
    public void run() {
        for (int i=0;i<=20;i++){
            System.out.println(i);
        }

    }
}
