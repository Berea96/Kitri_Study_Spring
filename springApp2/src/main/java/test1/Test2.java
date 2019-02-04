package test1;

public class Test2 {
	private Test t1;
	private int val;
	private String str;
	
	public Test2() {
	}
	
	public Test getT1() {
		return t1;
	}
	public void setT1(Test t1) {
		this.t1 = t1;
	}
	
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}

	@Override
	public String toString() {
		return this.t1 + " " + this.val + " " + this.str;
	}
}
