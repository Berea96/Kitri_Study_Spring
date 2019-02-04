package test1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	public static void main(String args[]) {
		
		String[] config = new String[] {"appConfig.xml"};
		ApplicationContext context = 
				new ClassPathXmlApplicationContext(config);
		Test t = (Test)context.getBean("t");
		
		System.out.println("str : " + t.str);
		System.out.println("num : " + t.num);
		
//		Test t2 = (Test)context.getBean("t2");
//		
//		System.out.println("str : " + t2.str);
//		System.out.println("num : " + t2.num);
//		
//		Test t3 = (Test)context.getBean("t3");
//		
//		System.out.println("str : " + t3.str);
//		System.out.println("num : " + t3.num);
//		
//		Test t4 = (Test)context.getBean("t4");
//		
//		System.out.println("str : " + t4.str);
//		System.out.println("num : " + t4.num);
		
		t.test1();
//		t2.test2();
//		t3.test3();
		
		String[] config2 = new String[] {"appConfig.xml"};
		ApplicationContext context2 = 
				new ClassPathXmlApplicationContext(config2);
		Test2 test2 = (Test2)context2.getBean("test2");
		
		System.out.println(test2);
		
		System.out.println(test2.getVal());
		System.out.println(test2.getStr());
		
		System.out.println(test2.getT1().str);
		System.out.println(test2.getT1().num);
		
		test2.getT1().test1();
		test2.getT1().test2();
		test2.getT1().test3();
		
		String[] config3 = new String[] {"appConfig.xml"};
		ApplicationContext context3 = 
				new ClassPathXmlApplicationContext(config3);
		Test2 testp = (Test2)context3.getBean("testp");
		
		System.out.println(testp);
	}
}
