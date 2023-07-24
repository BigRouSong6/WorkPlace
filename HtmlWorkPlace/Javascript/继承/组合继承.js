//核心思想：原型链继承和借用构造函数的组合继承
// 这个方法是JavaScript中最常用的继承模式。
// 父类的实例属性和方法即存在于子类的实例中，又存在于子类的原型中，不过仅是内存占用，在使用子类创建实例对象时，其原型中会存在两份相同的属性和方法

// 利用原型链实现对父类型对象的方法继承
// 利用super()借用父类型构建函数初始化相同属性

function Person(name,age){
    this.name = name;
    this.age = age;
}

Person.prototype.SetName = function(name){
    this.name = name;
};

function Student(name,age,price){
    Person.call(this,name,age);     //为了得到父类的实例属性和方法
    this.price = price;             //添加子类的私有属性
}

Student.prototype = new Person();  //为了得到父类的原型属性和方法
Student.prototype.constructor = Student;  //修正constructor的指向
Student.prototype.SetPrice = function(price){
    this.price = price;
};

var S = new Student("孙悟空",24,15000);
console.log(s.name,s.age,s.price);
S.SetName("猪八戒");        //调用父类的方法
S.SetPrice(16000);          //调用子类的方法
console.log(s.name,s.age,s.price);



