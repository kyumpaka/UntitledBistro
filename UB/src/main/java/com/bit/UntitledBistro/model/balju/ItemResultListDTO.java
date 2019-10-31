package com.bit.UntitledBistro.model.balju;

public class ItemResultListDTO {
	
	private int item_index;
	private String item_product_code;
	private String product_name;
	private String product_stndr;
	private int item_qty;
	private int product_safe;
	private String product_price;
	
	public int getItem_index() {
		return item_index;
	}
	public void setItem_index(int item_index) {
		this.item_index = item_index;
	}
	public String getItem_product_code() {
		return item_product_code;
	}
	public void setItem_product_code(String item_product_code) {
		this.item_product_code = item_product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_stndr() {
		return product_stndr;
	}
	public void setProduct_stndr(String product_stndr) {
		this.product_stndr = product_stndr;
	}
	public int getItem_qty() {
		return item_qty;
	}
	public void setItem_qty(int item_qty) {
		this.item_qty = item_qty;
	}
	public int getProduct_safe() {
		return product_safe;
	}
	public void setProduct_safe(int product_safe) {
		this.product_safe = product_safe;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	
	@Override
	public String toString() {
		return "ItemResultListDTO [item_index=" + item_index + ", item_product_code=" + item_product_code
				+ ", product_name=" + product_name + ", product_stndr=" + product_stndr + ", item_qty=" + item_qty
				+ ", product_safe=" + product_safe + ", product_price=" + product_price + "]";
	}
	
	
}

