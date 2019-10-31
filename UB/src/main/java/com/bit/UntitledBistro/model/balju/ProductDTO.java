package com.bit.UntitledBistro.model.balju;

public class ProductDTO {
	
	private String product_code;
	private String product_name;
	private String product_stndr;
	private String product_price;
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
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
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [product_code=" + product_code + ", product_name=" + product_name + ", product_stndr="
				+ product_stndr + ", product_price=" + product_price + "]";
	}
	
	
}
