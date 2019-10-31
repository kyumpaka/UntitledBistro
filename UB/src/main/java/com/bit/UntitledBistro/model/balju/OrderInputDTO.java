package com.bit.UntitledBistro.model.balju;

public class OrderInputDTO {
	
	private String ordin_num;
	private String ordin_end;
	
	public String getOrdin_num() {
		return ordin_num;
	}
	public void setOrdin_num(String ordin_num) {
		this.ordin_num = ordin_num;
	}
	public String getOrdin_end() {
		return ordin_end;
	}
	public void setOrdin_end(String ordin_end) {
		this.ordin_end = ordin_end;
	}
	
	@Override
	public String toString() {
		return "OrderInputDTO [ordin_num=" + ordin_num + ", ordin_end=" + ordin_end + "]";
	}
	
}
