package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;

public class MenuDTO {

	String menu_Code;
	String menu_Mt_Code;
	String menu_Name;
	int menu_Price;
	String menu_Image;
	String menu_State;
	ArrayList<IngredientDTO> IngredientDTO;
	
	public String getMenu_Code() {
		return menu_Code;
	}
	public void setMenu_Code(String menu_Code) {
		this.menu_Code = menu_Code;
	}
	public String getMenu_Mt_Code() {
		return menu_Mt_Code;
	}
	public void setMenu_Mt_Code(String menu_Mt_Code) {
		this.menu_Mt_Code = menu_Mt_Code;
	}
	public String getMenu_Name() {
		return menu_Name;
	}
	public void setMenu_Name(String menu_Name) {
		this.menu_Name = menu_Name;
	}
	public int getMenu_Price() {
		return menu_Price;
	}
	public void setMenu_Price(int menu_Price) {
		this.menu_Price = menu_Price;
	}
	public String getMenu_Image() {
		return menu_Image;
	}
	public void setMenu_Image(String menu_Image) {
		this.menu_Image = menu_Image;
	}
	public String getMenu_State() {
		return menu_State;
	}
	public void setMenu_State(String menu_State) {
		this.menu_State = menu_State;
	}
	public ArrayList<IngredientDTO> getIngredientDTO() {
		return IngredientDTO;
	}
	public void setIngredientDTO(ArrayList<IngredientDTO> ingredientDTO) {
		IngredientDTO = ingredientDTO;
	}
	
}
