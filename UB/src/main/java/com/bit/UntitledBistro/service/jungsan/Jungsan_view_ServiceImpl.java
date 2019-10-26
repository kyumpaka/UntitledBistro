package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DAO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;
@Service(value = "view")
public class Jungsan_view_ServiceImpl implements Jungsan_view_Service {
	
	@Autowired
	private SqlSession sqlsession;
	//View_jungsan.jsp
	@Override
	public int befor_cash() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_cash();
	}
	@Override
	public int befor_card() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_card();
	}
	@Override
	public int befor_point() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_point();
	}
	@Override
	public int today_cash() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_cash();
	}
	@Override
	public int today_card() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_card();
	}
	@Override
	public int today_point() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_point();
	}
	@Override
	public int menucount_drink() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_drink();
	}
	@Override
	public int menucount_cooking() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_cooking();
	}
	@Override
	public int menucount_soup() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.menucount_soup();
	}
	@Override
	public int befor_drink() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_drink();
	}
	@Override
	public int befor_cooking() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_cooking();
	}
	@Override
	public int befor_soup() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.befor_soup();
	}
	@Override
	public int last_week_drink() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.last_week_drink();
	}
	@Override
	public int last_week_cooking() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.last_week_cooking();
	}
	@Override
	public int last_week_soup() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.last_week_soup();
	}
	@Override
	public int Monday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Monday();
	}

	@Override
	public int Tuesday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Tuesday();
	}

	@Override
	public int Wednesday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Wednesday();
	}

	@Override
	public int Thursday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Thursday();
	}

	@Override
	public int Friday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Friday();
	}

	@Override
	public int Saturday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Saturday();
	}

	@Override
	public int Sunday() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.Sunday();
	}
	
	@Override
	public int today_one_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_one_Oclock();
	}

	@Override
	public int today_two_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_two_Oclock();
	}

	@Override
	public int today_three_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_three_Oclock();
	}

	@Override
	public int today_four_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_four_Oclock();
	}

	@Override
	public int today_five_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_five_Oclock();
	}

	@Override
	public int today_six_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_six_Oclock();
	}

	@Override
	public int today_seven_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_seven_Oclock();
	}

	@Override
	public int today_eight_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_eight_Oclock();
	}

	@Override
	public int today_nine_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_nine_Oclock();
	}

	@Override
	public int today_ten_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_ten_Oclock();
	}

	@Override
	public int today_eleven_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_eleven_Oclock();
	}

	@Override
	public int today_twelve_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_twelve_Oclock();
	}

	@Override
	public int today_thirteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_thirteen_Oclock();
	}

	@Override
	public int today_fourteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_fourteen_Oclock();
	}

	@Override
	public int today_fifteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_fifteen_Oclock();
	}

	@Override
	public int today_sixteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_sixteen_Oclock();
	}

	@Override
	public int today_seventeen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_seventeen_Oclock();
	}

	@Override
	public int today_eighteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_eighteen_Oclock();
	}

	@Override
	public int today_nineteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_nineteen_Oclock();
	}

	@Override
	public int today_twenty_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_twenty_Oclock();
	}

	@Override
	public int today_twentyone_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_twentyone_Oclock();
	}

	@Override
	public int today_twentytwo_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_twentytwo_Oclock();
	}

	@Override
	public int today_twentythree_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_twentythree_Oclock();
	}

	@Override
	public int today_zero_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_zero_Oclock();
	}

	@Override
	public int yesterday_one_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_one_Oclock();
	}

	@Override
	public int yesterday_two_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_two_Oclock();
	}

	@Override
	public int yesterday_three_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_three_Oclock();
	}

	@Override
	public int yesterday_four_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_four_Oclock();
	}

	@Override
	public int yesterday_five_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_five_Oclock();
	}

	@Override
	public int yesterday_six_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_six_Oclock();
	}

	@Override
	public int yesterday_seven_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_seven_Oclock();
	}

	@Override
	public int yesterday_eight_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_eight_Oclock();
	}

	@Override
	public int yesterday_nine_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_nine_Oclock();
	}

	@Override
	public int yesterday_ten_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_ten_Oclock();
	}

	@Override
	public int yesterday_eleven_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_eleven_Oclock();
	}

	@Override
	public int yesterday_twelve_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_twelve_Oclock();
	}

	@Override
	public int yesterday_thirteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_thirteen_Oclock();
	}

	@Override
	public int yesterday_fourteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_fourteen_Oclock();
	}

	@Override
	public int yesterday_fifteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_fifteen_Oclock();
	}

	@Override
	public int yesterday_sixteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_sixteen_Oclock();
	}

	@Override
	public int yesterday_seventeen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_seventeen_Oclock();
	}

	@Override
	public int yesterday_eighteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_eighteen_Oclock();
	}

	@Override
	public int yesterday_nineteen_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_nineteen_Oclock();
	}

	@Override
	public int yesterday_twenty_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_twenty_Oclock();
	}

	@Override
	public int yesterday_twentyone_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_twentyone_Oclock();
	}

	@Override
	public int yesterday_twentytwo_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_twentytwo_Oclock();
	}

	@Override
	public int yesterday_twentythree_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_twentythree_Oclock();
	}

	@Override
	public int yesterday_zero_Oclock() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.yesterday_zero_Oclock();
	}
	//Show_List.jsp
	@Override
	public List<Jungsan_view_DTO> jungsan_state(HashMap map) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		System.out.println("리스트 실행 서비스단");
		return jungsan_view_DAO.jungsan_state(map);
	}
	@Override
	public void update_state(Jungsan_view_DTO dto) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		jungsan_view_DAO.update_state(dto);
		System.out.println("insert_state bbbbb");
	}
	//연휴 대비 데이터 입력
	@Override
	public void Show_list(Jungsan_view_DTO dto) {
		Jungsan_view_DAO dao = sqlsession.getMapper(Jungsan_view_DAO.class);
		int tmp = dao.today_total();
		int tmp2 = dao.before_total();
		if(tmp == 0 || tmp2 == 0){
			dao.insert_Initial_value(dto);
			dao.insert_Initial_value2(dto);
			dao.delete_state(dto);
		}else {
			dao.insert_Initial_value(dto);
			dao.delete_state(dto);
		}
		
	}
	@Override
	public void delete_state(Jungsan_view_DTO dto) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		jungsan_view_DAO.delete_state(dto);
	}

	@Override
	public void insert_Initial_value(Jungsan_view_DTO dto) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		jungsan_view_DAO.insert_Initial_value(dto);
	}
	
	@Override
	public void insert_Initial_value2(Jungsan_view_DTO dto) {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		jungsan_view_DAO.insert_Initial_value2(dto);
	}

	@Override
	public int today_total() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.today_total();
	}

	@Override
	public int before_total() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.before_total();
	}
	//Day_DeadLine.jsp
	@Override
	public int expenditure() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.expenditure();
	}

	@Override
	public int worketime() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.worketime();
	}

	@Override
	public int parttime() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.parttime();
	}

	@Override
	public int employee() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.employee();
	}

	@Override
	public int personnel() {
		Jungsan_view_DAO jungsan_view_DAO = sqlsession.getMapper(Jungsan_view_DAO.class);
		return jungsan_view_DAO.personnel();
	}

}
