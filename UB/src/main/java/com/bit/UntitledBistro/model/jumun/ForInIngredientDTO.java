package com.bit.UntitledBistro.model.jumun;

public class ForInIngredientDTO {
	
	private int ingredient_qty;
	private int item_qty;
	private String ingredient_product_code;
	private String ingredient_menu_code;
	private String orders_no;
	
	
	public int getIngredient_qty() {
		return ingredient_qty;
	}
	public void setIngredient_qty(int ingredient_qty) {
		this.ingredient_qty = ingredient_qty;
	}
	public int getItem_qty() {
		return item_qty;
	}
	public void setItem_qty(int item_qty) {
		this.item_qty = item_qty;
	}
	public String getIngredient_product_code() {
		return ingredient_product_code;
	}
	public void setIngredient_product_code(String ingredient_product_code) {
		this.ingredient_product_code = ingredient_product_code;
	}
	public String getIngredient_menu_code() {
		return ingredient_menu_code;
	}
	public void setIngredient_menu_code(String ingredient_menu_code) {
		this.ingredient_menu_code = ingredient_menu_code;
	}
	public String getOrders_no() {
		return orders_no;
	}
	public void setOrders_no(String orders_no) {
		this.orders_no = orders_no;
	}
	
	@Override
	public String toString() {
		return "ForInIngredientDTO [ingredient_qty=" + ingredient_qty + ", item_qty=" + item_qty
				+ ", ingredient_product_code=" + ingredient_product_code + ", ingredient_menu_code="
				+ ingredient_menu_code + ", orders_no=" + orders_no + "]";
	}
		 
}
