package com.yuhuyi.demo2;

public class GirFriendTest {
    public static void main(String[] args) {
        //创建女朋友的对象
        GirlFriend gf1 = new GirlFriend();
        //赋值
        gf1.setName("chenchen");
        gf1.setAge(18);
        gf1.setGender("女");
        //检验
        String name = gf1.getName();
        int age = gf1.getAge();
        String gender = gf1.getGender();

        System.out.println(name+age+gender);
        gf1.playgame();

        
    }
}
