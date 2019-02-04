package member;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import member.dto.Member;

public class MemberMain {
	public static void main(String args[]) {
		String[] config = new String[] {"appConfig.xml"};
		ApplicationContext context = 
					new ClassPathXmlApplicationContext(config);
	}
}
