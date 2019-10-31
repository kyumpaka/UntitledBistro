package com.bit.UntitledBistro.model.balju;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Balju_DAOimpl implements Balju_DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// namespace = "매퍼경로"; 생략 후 직접 입력 balju. [ namespace + ".메소드명 ]
	
	
	@Override
	public void insert_Balju_Plan1() {
		sqlSession.insert("balju.insert_Balju_Plan1");
	}

	
	@Override
	public void insert_Balju_Plan2(OrderPlanDTO orderPlanDTO) {
		sqlSession.insert("balju.insert_Balju_Plan2", orderPlanDTO);
	}

	@Override
	public void insert_Balju1() {
		sqlSession.insert("balju.insert_Balju1"); 

	}

	@Override
	public void insert_Balju2(OrderListDTO orderListDTO) {
		System.out.println("마지막");
		System.out.println(orderListDTO);
		sqlSession.insert("balju.insert_Balju2", orderListDTO);

	}

	
	//품목 새창 리스트 불러오기용
	@Override
	public List<ProductDTO> item_list() {
		return sqlSession.selectList("balju.item_list");
	}
	//품목 재고현황 리스트 불러오기용
	@Override
	public List<ItemResultListDTO> item_resultList() {
		return sqlSession.selectList("balju.item_resultList");
	}

	@Override
	public List<OrderPlanDTO> balju_Plan_list() {
		return sqlSession.selectList("balju.balju_Plan_list");
		
	}

	@Override
	public List<BaljuResultDTO> balju_Result() {
		return sqlSession.selectList("balju.balju_Result"); 
	}

	@Override
	public List<BaljuResultDTO> balju_Result_Search(BaljuResultDTO baljuResultDTO){
		return sqlSession.selectList("balju.balju_Result_Search", baljuResultDTO);
	}
	
	@Override
	public List<OrderInputOrderListDTO> balju_Mng_List() {
		return sqlSession.selectList("balju.balju_Mng_List");
	}
	
	@Override
	public List<OrderInputOrderListDTO> balju_Mng_Filter(String FilterParam){
		return sqlSession.selectList("balju.balju_Mng_Filter", FilterParam);
	}
	
	@Override
	public void balju_Plan_modi(OrderPlanDTO orderPlanDTO) {
		sqlSession.update("balju.balju_Plan_modi", orderPlanDTO); 
	}

	@Override
	public void balju_Modi(OrderListDTO orderListDTO) {
		sqlSession.update("balju.balju_Modi", orderListDTO);
	}
	
	@Override
	public void End_Balju(OrderInputDTO orderInputDTO) {
		sqlSession.update("balju.End_Balju", orderInputDTO);
	}
	
	@Override
	public void orderListInItemUpdate(int  order_ordin_num) {
		sqlSession.update("balju.orderListInItemUpdate", order_ordin_num);
	}

	@Override
	public void Delete_Balju_Plan1() {
		sqlSession.delete("balju.Delete_Balju_Plan1");

	}

	@Override
	public void Delete_Balju_Plan2(OrderPlanDTO orderPlanDTO) {
		sqlSession.delete("balju.Delete_Balju_Plan2", orderPlanDTO);

	}

	@Override
	public void Delete_Balju1(OrderInputDTO orderInputDTO) {
		sqlSession.delete("balju.Delete_Balju1", orderInputDTO);

	}

	@Override
	public void Delete_Balju2(OrderListDTO orderListDTO) {
		sqlSession.delete("balju.Delete_Balju2", orderListDTO);

	}
	
	//BookMark 영역
	@Override
	public void insert_BookMark(BookMarkDTO bookMarkDTO) {
		sqlSession.insert("balju.insert_BookMark", bookMarkDTO);
		
	}

	@Override
	public void BookMark_Modi(BookMarkDTO bookMarkDTO) {
		sqlSession.update("balju.BookMark_Modi", bookMarkDTO);
		
	}

	@Override
	public void Delete_BookMark(BookMarkDTO bookMarkDTO) {
		sqlSession.delete("balju.Delete_BookMark", bookMarkDTO);
		
	}

	@Override
	public List<ItemBookMarkDTO> item_BookMark(ItemBookMarkDTO itemBookMarkDTO) {
		return sqlSession.selectList("balju.item_BookMark", itemBookMarkDTO);
	}

	@Override
	public List<OrderInputOrderPlanDTO> BPlan_Load() {
		return sqlSession.selectList("balju.BPlan_Load");
	}

	@Override
	public List<OrderListDTO> BPlan_Search(OrderInputOrderPlanDTO inputOrderPlanDTO) {
		return sqlSession.selectList("balju.BPlan_Search", inputOrderPlanDTO); 
	}

	

}
