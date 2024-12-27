import java.util.Scanner;

public class ScannerDemo1 {
	public static void main(String[] args) {
		//创建对象,表示我们现在要用这个类Scanner
		Scanner sc = new Scanner(System.in);
		System.out.println("请输入整数");
		//接收数据
		int i = sc.nextInt();
		System.out.println(i);
	}
}