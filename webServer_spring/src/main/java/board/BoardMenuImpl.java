package board;

import java.util.ArrayList;
import java.util.Scanner;

import member.MemberMenuImpl;

public class BoardMenuImpl implements BoardMenu {
	private Service service;
	
	private Article a;
	
	public BoardMenuImpl(Service service, Article a) {
		this.service = service;
		this.a = a;
	}
	
	public void run(Scanner sc) {
		boolean flag = true;
		int menu;
		String str = "1.글작성 2.글조회 3.검색 4.이전";
		while(flag) {
			System.out.println(str);
			menu = sc.nextInt();
			
			switch (menu) {
			case 1:
				write(sc);
				break;
			case 2:
				boardView(sc);
				break;
			case 3:
				boardSearch(sc);
				break;
			case 4:
				flag = false;
				break;
			default:
				break;
			}
		}
	}
	
	public void write(Scanner sc) {
		System.out.println("=====글 작성=====");
		System.out.println("작성자 : " + MemberMenuImpl.m.getId());
		System.out.println("제목 : ");
		String title = sc.next();
		a.setTitle(title);
		System.out.println("내용 : ");
		String content = sc.next();
		a.setContent(content);
		a.setNum(0);
		a.setW_date(null);
		a.setWriter(MemberMenuImpl.m.getId());
		service.addArticle(a);
	}
	
	public void boardView(Scanner sc) {
		System.out.println("=====글 조회=====");
		showList(service.GetAll());
		boardViewMenu(sc);
	}
	
	public void boardViewMenu(Scanner sc) {
		System.out.println("1.글 상세보기 2.글 삭제 3.뒤로가기");
		int n = sc.nextInt();
		if(n == 1) {
			boardDetail(sc);
		}
		else if(n == 2){
			boardDelete(sc);
		}

	}
	
	public void boardDetail(Scanner sc) {
		System.out.println("글 번호 입력");
		
		Article aa = service.getByNum(sc.nextInt());
		System.out.println(aa);
		if(aa.getWriter().equals(MemberMenuImpl.m.getId())) {
			System.out.println("1.수정하기 2.나가기");
			int n = sc.nextInt();
			if(n == 1) {
				System.out.print("변경할 제목 : ");
				aa.setTitle(sc.next());
				System.out.println("변경할 내용");
				aa.setContent(sc.next());
				service.editArticle(aa);
			}
		}
		else {
			System.out.println("1. 나가기.");
			sc.nextInt();
		}
	}
	
	public void boardDelete(Scanner sc) {
		System.out.println("글 번호 입력");
		int n = sc.nextInt();
		Article aa = service.getByNum(n);
		if(MemberMenuImpl.m.getId().equals(aa.getWriter()))
			service.delArticle(n);
		else {
			System.out.println("글 작성자만 가능");
		}
	}
	
	public void boardSearch(Scanner sc) {
		System.out.println("1.작성자로 검색 2.제목으로 검색 3.뒤로가기");
		int n = sc.nextInt();
		if(n == 1) {
			System.out.print("작성자 : ");
			showList(service.getByWriter(sc.next()));
			boardViewMenu(sc);
		}
		else if(n ==2) {
			System.out.print("글 제목 : ");
			showList(service.getTitle(sc.next()));
			boardViewMenu(sc);
		}
	}
	
	public void showList(ArrayList<Article> list) {
		for(Article a : list) {
			System.out.println("글 번호 : " + a.getNum() + 
							   ", 글 제목 : " + a.getTitle() + 
							   ", 작성자 : " + a.getWriter());
		}
	}
}
