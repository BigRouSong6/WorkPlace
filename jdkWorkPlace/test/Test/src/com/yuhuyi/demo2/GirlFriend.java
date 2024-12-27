package com.yuhuyi.demo2;

public class GirlFriend {
    //属性
    private String name;
    private int age;
    private String gender;
    //对于每个私有化的成员变量，都要提供set和get方法
    //名字name
    public  void setName(String n) {
        name = n;
    }

    public  String getName() {
        return name;
    }

    //年龄age，可以对其进行判断
    public  void setAge(int i){
        if (i>=18 && i<50) {
            age = i;
        }else{
            System.out.println("非法数据");
        }
    }

    public  int getAge(){
        return age;
    }
    //性别gender
    public  void setGender(String G) {
        gender = G;
    }

    public String getGender(){
        return gender;
    }

    //行为
    public void sleep(){
        System.out.println("女朋友在睡觉");
    }

    public void playgame(){
        System.out.println("女朋友在玩手机");
    }






}
