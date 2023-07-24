//创建类
class Star{
    constructor(name,age){
        this.name = name;
    };
    sing(song){
        console.log(this.name+':'+song)
    }
}
//类中的函数不需function，无需逗号隔开
//类的共有属性和方法一定要加this使用

//利用类创建对象
var ldh =  new Star('刘德华',20);
var zxy =  new Star('张学友',10);
console.log(ldh.name);
console.log(zxy.name);
ldh.sing('冰雨');
zxy.sing('李香兰');
