package main;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	public static void main(String args[]) {
		String config[] = new String[] {"appConfig.xml"};
		ApplicationContext context = 
				new ClassPathXmlApplicationContext(config);
		MainMenu m = (MainMenu)context.getBean("mainMenu");
		m.run(new Scanner(System.in));
	}
}