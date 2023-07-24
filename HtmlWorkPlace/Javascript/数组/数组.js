//创建数组
var arr = new Array();  //使用对象创建
var arr = [1,2,4,5,6]   //使用字面量[]创建


//遍历数组
for(var i = 0; i < arr.length; i++){
    console.log(arr[i]);
}

//数组属性
console.log(arr.constructor);       //返回创建数组对象的原型函数

//数组方法
var arr_1 = arr.push(7,8,9);        //末尾添加多个，返回新的长度
console.log(arr_1)

var arr_3 = arr_2.pop()             //末尾删除一个元素，返回删除元素
console.log(arr_3)


var arr_2 = arr_1.unshift(11,12,13);    //开头添加多个，返回新的长度
console.log(arr_2)

var arr_4 = arr_3.shift()           //开头删除一个元素，返回删除元素
console.log(arr_4)


//遍历数组
arr_4.forEach(function(value,index,obj){
    console.log(`正在遍历第个数组${index}，值为${value}，数组为${obj}`)
})

//切片
var arr_5 = arr_4.slice(1,3);           //不会改变原数组，生成一个新的数组，且索引可以为负数
console.log(arr_5);

//splice()方法
var arr_10 = ["孙悟空", "猪八戒", "沙和尚", "唐僧", "白骨精"];
var result = arr_10.splice(3,2,"牛魔王","铁扇公主","红孩儿")          //删除原来数组，（开始索引，个数，新增内容【放在开始索引的前面】）

//拼接
var arr_11 = arr_1.concat(arr_2,arr_3,arr_4,"铁扇公主","红孩儿")      //拼接两个或者多个数组，不改变原来的数组，返回新的数组

//字符串拼接
arr_10.join("@")

//反转数组
arr_11.reverse();       //反转数组，修改原数组

//排序
arr_11.sort()           //按照Unicode编码进行排序，即使是数组也会按照Unicode编码进行排序



