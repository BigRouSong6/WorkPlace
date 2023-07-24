//创建对象的三种方法
    // 对象字面量
    // new Object();
    // 自定义的构造函数

var obj2 = {};
var obj1 = new Object();

//利用构造函数
function Star(name,age){
    this.name = name;
    this.age = age;
    this.sing = function(){
        console.log('我会唱歌');
    }
};


//对象添加操作
// Star.prototype.say = function(){
//     console.log('我在说话');
// }


Star.prototype = {
    constructor : Star,             //用对象的形式修改了原型对象，需手动指回原来的构造函数
    say : function(){
        console.log('我会说话');
    },
    cry : function(){
        console.log('我会哭');
    }
};

var ldh = new Star('刘德华',18);        //新开辟了空间，生成了新的sing方法
var zxy = new Star('张学友',20);        //新开辟了空间，生成了新的sing方法
ldh.sing();
zxy.sing();


// new在执行时会做四件事情:
    // 在内存中创建一个新的空对象
    // 让this 指向这个新的对象
    // 执行构造函数里面的代码，给这个新对象添加属性和方法
    // 返回这个新对象(所以构造函数里面不需要 return)

//  实例成员只能通过实例化来访问，静态成员只能通过构造函数来访问
//一般情况下，属性放到构造函数里面去，方法放到原型对象里面去（防止开辟多余的空间）


//构造函数原型prototype
    //通过原型分配的函数是所有对象共享的
    //prototype是构造函数的一个属性，它是一个对象，它的属性和方法会被构造函数所共享


//每一个实例对象都有一个__proto__属性，指向构造函数的原型对象prototype
//其实ldh.__proto__和Star.prototype是全等的，二者都有一个constructor属性，指向Star构造函数本身（记录）

//很多时候，我们需要利用constructor手动指回原来的构造函数

//Star.prototype也是对象，它的__proto__指向Object.prototype，再往上就是null