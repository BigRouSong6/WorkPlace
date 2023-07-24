//核心思想：子类的原型为父类的一个实例对象
// 缺点：
// 1、原型链继承的多个实例的引用类型属性指向相同，一个实例修改了原型属性，另外一个实例的原型属性也会被修改
// 2、不能传递参数
// 3、继承单一

// 定义父类型构造函数
function SupperType(){
    this.supProp = 'Super property'
}
// 给父类型的原型添加方法
SupperType.prototype.showSupperProp = function(){
    console.log(this.supProp)
}

// 定义子类型的构造函数
function SubType(){
    this.subProp = 'Sub property'
}

// 创建父类型的对象赋值给子类型的原型
SubType.prototype = new SupperType();

// 将子类型原型的构造属性设置为子类型
SubType.prototype.constructor = SubType;

// 给子类型原型添加方法
SubType.prototype.showSubProp = function(){
    console.log(this.subProp)
}

// 创建子类型的对象: 可以调用父类型的方法
var subType = new SubType();
subType.showSupperProp();
subType.showSubProp();

