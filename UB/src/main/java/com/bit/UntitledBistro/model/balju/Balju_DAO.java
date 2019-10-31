package com.bit.UntitledBistro.model.balju;

import java.util.List;

public interface Balju_DAO {

	void insert_Balju_Plan1();

	void insert_Balju_Plan2(OrderPlanDTO orderPlanDTO);

	void insert_Balju1();

	void insert_Balju2(OrderListDTO orderListDTO);

	//품목 새창 리스트 불러오기용
	List<ProductDTO> item_list();

	//품목 재고현황 리스트 불러오기용
	List<ItemResultListDTO> item_resultList();

	List<OrderPlanDTO> balju_Plan_list();

	List<BaljuResultDTO> balju_Result();

	List<BaljuResultDTO> balju_Result_Search(BaljuResultDTO baljuResultDTO);

	List<OrderInputOrderListDTO> balju_Mng_List();

	List<OrderInputOrderListDTO> balju_Mng_Filter(String FilterParam);

	void balju_Plan_modi(OrderPlanDTO orderPlanDTO);

	void balju_Modi(OrderListDTO orderListDTO);

	void End_Balju(OrderInputDTO orderInputDTO);

	void orderListInItemUpdate(int order_ordin_num);

	void Delete_Balju_Plan1();

	void Delete_Balju_Plan2(OrderPlanDTO orderPlanDTO);

	void Delete_Balju1(OrderInputDTO orderInputDTO);

	void Delete_Balju2(OrderListDTO orderListDTO);

	//BookMark 영역
	void insert_BookMark(BookMarkDTO bookMarkDTO);

	void BookMark_Modi(BookMarkDTO bookMarkDTO);

	void Delete_BookMark(BookMarkDTO bookMarkDTO);

	List<ItemBookMarkDTO> item_BookMark(ItemBookMarkDTO itemBookMarkDTO);

	List<OrderInputOrderPlanDTO> BPlan_Load();

	List<OrderListDTO> BPlan_Search(OrderInputOrderPlanDTO orderInputOrderPlanDTO);

}