class Father{
    constructor(x,y){
        this.x = x;
        this.y = y;
    }
    money(){
        console.log('父类有100存款');

    }
    summ(){
        console.log(this.x+this.y)
    }
    say(){
        console.log('我是爸爸')
    }
    cry(){
        console.log('爸爸哭了');
    }
}


//继承父类的属性和方法
class Son extends Father{
    constructor(x,y){
        super(x,y);        //调用了父类中的构造函数，必须在子类this之前调用
        this.x = x;
        this.y = y;
    }
    say(){
        console.log('我是儿子');
    }
    cry(){
        console.log(super.cry());
    }
    //子类独有的方法
    substract(){
        console.log(this.x-this.y);
    }
}

var son = Son(1,2);
son.money();
son.summ();
son.say();      //优先输出子类，就近原则
son.cry();      //super可以调用父类的普通方法



