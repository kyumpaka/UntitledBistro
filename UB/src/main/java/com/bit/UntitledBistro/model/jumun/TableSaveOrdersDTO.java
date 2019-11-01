package com.bit.UntitledBistro.model.jumun;

public class TableSaveOrdersDTO {

	private String tablesave_code;
	private String orders_tablesave_code;
	
	public String getTablesave_code() {
		return tablesave_code;
	}
	public void setTablesave_code(String tablesave_code) {
		this.tablesave_code = tablesave_code;
	}
	public String getOrders_tablesave_code() {
		return orders_tablesave_code;
	}
	public void setOrders_tablesave_code(String orders_tablesave_code) {
		this.orders_tablesave_code = orders_tablesave_code;
	}
	
	@Override
	public String toString() {
		return "TableSaveOrdersDTO [tablesave_code=" + tablesave_code + ", orders_tablesave_code="
				+ orders_tablesave_code + "]";
	}
	
}
