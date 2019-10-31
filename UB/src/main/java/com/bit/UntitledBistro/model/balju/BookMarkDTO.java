package com.bit.UntitledBistro.model.balju;

public class BookMarkDTO {
	
	private String bk_code;
	private String bk_name;
	private String bk_stndr;
	private int bk_pr_ea;
	private int bk_qt;
	private String bk_wr;
	
	public String getBk_code() {
		return bk_code;
	}
	public void setBk_code(String bk_code) {
		this.bk_code = bk_code;
	}
	public String getBk_name() {
		return bk_name;
	}
	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}
	public String getBk_stndr() {
		return bk_stndr;
	}
	public void setBk_stndr(String bk_stndr) {
		this.bk_stndr = bk_stndr;
	}
	public int getBk_pr_ea() {
		return bk_pr_ea;
	}
	public void setBk_pr_ea(int bk_pr_ea) {
		this.bk_pr_ea = bk_pr_ea;
	}
	public int getBk_qt() {
		return bk_qt;
	}
	public void setBk_qt(int bk_qt) {
		this.bk_qt = bk_qt;
	}
	public String getBk_wr() {
		return bk_wr;
	}
	public void setBk_wr(String bk_wr) {
		this.bk_wr = bk_wr;
	}
	
	@Override
	public String toString() {
		return "BookMarkDTO [bk_code=" + bk_code + ", bk_name=" + bk_name + ", bk_stndr=" + bk_stndr + ", bk_pr_ea="
				+ bk_pr_ea + ", bk_qt=" + bk_qt + ", bk_wr=" + bk_wr + "]";
	}
	
}
