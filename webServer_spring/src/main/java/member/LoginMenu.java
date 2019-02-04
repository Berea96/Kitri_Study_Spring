package member;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;

import board.BoardMenuImpl;

public class LoginMenu {
	private Service service;
	
	public void setService(Service service) {
		this.service = service;
	}	
	
	public void run(Scanner sc, ApplicationContext context) {
		boolean flag = true;
		int menu;
		String str = "1.내정보 조회 2.로그아웃 3.탈퇴  4.게시판";
		while(flag) {
			System.out.println(str);
			menu = sc.nextInt();
			switch (menu) {
			case 1:
				info(sc);
				break;
			case 2:
				System.out.println("로그아웃");
				MemberMenuImpl.m = null;
				flag = false;
				break;
			case 3:
				System.out.println("탈퇴할 겁니까?");
				System.out.println("1.탈퇴 2.취소");
				int n2 = sc.nextInt();
				if(n2 == 1)
					service.delMember(MemberMenuImpl.m.getId());
				break;
			case 4:
				((BoardMenuImpl)context.getBean("boardMenu")).run(sc);
				break;
			default:
				break;
			}
		}
	}
	
	public void info(Scanner sc) {
		System.out.println("======조회======");
		System.out.println(MemberMenuImpl.m);
		System.out.println("1.수정 2.돌아가기");
		int n = sc.nextInt();
		if(n == 1) {
			System.out.println("변경할 비밀번호");
			String pwd = sc.nextLine();
			System.out.println("변경할 이메일");
			String email = sc.nextLine();
			service.editMyInfo(new Member(
					MemberMenuImpl.m.getId(), pwd, MemberMenuImpl.m.getName(), email));
		}
	}
}
