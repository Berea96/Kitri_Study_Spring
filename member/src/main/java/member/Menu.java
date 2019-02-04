package member;

import java.util.Scanner;

public class Menu {
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	public void run(Scanner sc) {
		boolean flag = false;
		int menu;
		String str = "";
		while(flag) {
			menu = sc.nextInt();
			switch (menu) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
			case 4: 
				break;
			case 5: 
				break;
			default:
				break;
			}
		}
	}
}
