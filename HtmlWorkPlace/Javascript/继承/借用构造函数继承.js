//核心思想：使用.call()和.apply()将父类构造函数引入子类函数，使用父类构造函数来增强子类实例，等同于复制父类的实例给子类
// 缺点：
// 1、只能继承父类的实例属性和方法，不能继承原型的属性和方法
// 2、无法实现构造函数的复用，每个子类都有父类实例函数的副本，影响性能，代码臃肿

// 定义父类型构造函数
function SupperType(name){
    this.name = name;
    this.showSupperName = function(){
        console.log(this.name)
    }
}
// 定义子类型的构造函数
function SubType(name,age){
    //在子类型中调用call方法继承子SupperType
    SupperType.call(this,name);
    this.age = age
}


// 给子类型的原型添加方法
SubType.prototype.showSubName = function(){
    console.log(this.name)
}

// 创建子类型的对象然后调用
subType = new SubType("孙悟空",20);
subType.showSupperName();
subType.showSubName();
console.log(subType.name);
console.log(subType.age);


