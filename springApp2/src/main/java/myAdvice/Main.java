package myAdvice;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String args[]) {
		String[] config = new String[] {"appConfig.xml"};
		ApplicationContext context = 
				new ClassPathXmlApplicationContext(config);
		AdviceTest test = (AdviceTest)context.getBean("adviceTest");
		
		test.test1();
		test.test2();
		test.test3();
	}
}
