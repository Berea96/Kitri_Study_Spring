package member;

import java.util.Scanner;

import board.BoardMenu;

public class MemberMenuImpl implements MemberMenu{
	public static Member m;
	
	private Service service;
	private BoardMenu bod_menu;
	private Member member;

	public MemberMenuImpl(Service service, BoardMenu bod_menu, Member member) {
		this.service = service;
		this.bod_menu = bod_menu;
		this.member = member;
	}

	public void run(Scanner sc) {
		boolean flag = true;
		int menu;
		String str = "1.가입  2.로그인 3.종료";
		while(flag) {
			System.out.println(str);
			menu = sc.nextInt();
			switch (menu) {
			case 1:
				join(sc);
				break;
			case 2:
				login(sc);
				break;
			case 3:
				flag = false;
				break;
			default:
				break;
			}
		}
	}
	
	public void join(Scanner sc) {
		System.out.println("======가입======");
		String idd = "";
		do {
			System.out.print("아이디 : ");
			idd = sc.next();
		}while(!service.checkId(idd));
		
		member.setId(idd);
		System.out.print("비밀번호 : ");
		member.setPwd(sc.next());
		System.out.print("이름 : ");
		member.setName(sc.next());
		System.out.print("이메일 : ");
		member.setEmail(sc.next());
		service.join(member);
	}
	
	public void login(Scanner sc) {
		System.out.println("======로그인======");
		System.out.print("아이디 : ");
		String id = sc.next();
		System.out.print("비밀번호 : ");
		String pwd = sc.next();
		if(service.login(id, pwd)) {
			loginSuccess(sc);
		}
		else 
			System.out.println("로그인 실패 다시시도");
	}
	
	public void loginSuccess(Scanner sc) {
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
				flag = logout();
				break;
			case 3:
				delMember(sc);
				break;
			case 4:
				bod_menu.run(sc);
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
	
	public boolean logout() {
		System.out.println("로그아웃");
		MemberMenuImpl.m = null;
		return false;
	}
	
	public void delMember(Scanner sc) {
		System.out.println("탈퇴할 겁니까?");
		System.out.println("1.탈퇴 2.취소");
		int n = sc.nextInt();
		if(n == 1)
			service.delMember(MemberMenuImpl.m.getId());
	}
}
