package main;

import java.util.Scanner;

import board.BoardMenu;
import member.MemberMenu;

public class MainMenu {
	private MemberMenu mem_menu;
	
	public MainMenu(MemberMenu mem_menu) {
		super();
		this.mem_menu = mem_menu;
	}

	public void run(Scanner sc) {
		mem_menu.run(sc);
	}
}
