package test2;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String args[]) {
		String[] config = new String[] {"appConfig.xml"};
		ApplicationContext context = 
				new ClassPathXmlApplicationContext(config);
		Menu menu = (Menu)context.getBean("menuB");
		
		menu.run(new Scanner(System.in));
	}
}
