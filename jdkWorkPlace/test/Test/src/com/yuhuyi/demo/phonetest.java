package com.yuhuyi.demo;
//类的实例化——对象
public class phonetest {
    public static void main(String[] args) {
        //创建手机类的对象
        phone p = new phone();
        //赋值属性
        p.brand = "苹果";
        p.price = 6000;


        //获取对象中的值
        System.out.println(p.brand);
        System.out.println(p.price);

        //行为
        p.call();
        p.playgame();
    }
}
