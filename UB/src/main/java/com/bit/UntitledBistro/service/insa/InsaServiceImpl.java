package com.bit.UntitledBistro.service.insa;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.insa.InsaDAO;
import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.model.insa.Insa_SalaryDTO;
import com.bit.UntitledBistro.model.insa.Insa_ScheduleDTO;

@Service("test")
public class InsaServiceImpl implements InsaService {

	@Autowired
	private SqlSession sqlsession;	
	
	@Override
	public int EmpRegisterInsert(Insa_EmpRegisterDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		insaDAO.EmpRegisterInsert(dto);

		return 1;
	}

	@Override
	public List<Insa_EmpRegisterDTO> EmpRegisterList(HashMap map) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.EmpRegisterList(map);
	}

	@Override
	public Insa_EmpRegisterDTO EmpRegisterRead(String empregister_empnum) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.EmpRegisterRead(empregister_empnum);
	}

	@Override
	public String imgUpload(MultipartHttpServletRequest mRequest) {

		String saveFileName = null;

		try {
			String uploadPath = mRequest.getSession().getServletContext().getRealPath("/") + "resources/images/insa/";

			File dir = new File(uploadPath);

			// 디렉토리 생성
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			Iterator<String> iter = mRequest.getFileNames();

			while (iter.hasNext()) {
				String uploadFileName = iter.next();

				MultipartFile mFile = mRequest.getFile(uploadFileName);
				String originalFileName = mFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				if (originalFileName != "") {
					saveFileName = uuid + "_" + originalFileName;
					byte[] data = mFile.getBytes();
					FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
					System.out.println("uploadPath  : " + uploadPath );
					fos.write(data);
					fos.close();
				} else {
					saveFileName = "noImage.jpg";
				}

			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return saveFileName; 
	}

	@Override
	public int EmpRegisterUpdate(Insa_EmpRegisterDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		System.out.println(dto.toString());
		return insaDAO.EmpRegisterUpdate(dto);

	}

	@Override
	public boolean InsaLoginSearch(Insa_EmpRegisterDTO dto, HttpSession session) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		Insa_EmpRegisterDTO dto2 = insaDAO.viewMember(dto);
		session.setAttribute("empregister_empnum", dto2.getEmpregister_empnum());
		session.setAttribute("empregister_name", dto2.getEmpregister_name());
			
		return true;
	}

   @Override
   public int WorkCheck(Insa_EmpRegisterDTO dto) {
      InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
      int idCheck = insaDAO.WorkCheck(dto);
      if(idCheck == 1)  { //아이디 비밀번호가 모두 일치하는 놈 개수 emp
         int toDayCheck = insaDAO.DayCheck(dto);
         int paytime = insaDAO.PayCheckByNum(dto);
         if(toDayCheck == 0) { //아이디가 일치하는 놈의 개수 schedule
            // 출근이 없으면 출근
            insaDAO.WorkAdd(dto);
            if(paytime != 0) { // 알바인지 여부
               insaDAO.SalaryAdd(dto); // 알바
            } else {
               insaDAO.SalaryDayAdd(dto); // 직원
            }
            return 1;
         } else {
            // 출근이 있으면 퇴근
            insaDAO.WorkEnd(dto);
            if(paytime != 0) { // 알바인지 여부
               insaDAO.SalaryUpdate(dto); // 알바
            } else {
               insaDAO.SalaryDayUpdate(dto); // 직원
            }
            return 2;
         }
      }
      // 없는 직원
      return idCheck;
   }

   @Override
	public boolean WorkLoginCheck(Insa_EmpRegisterDTO dto, HttpSession session) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		String name = insaDAO.InsaLoginCheck(dto);
		boolean result = false;
		
		if(name != null) result = true;	
		return result;
	}

	@Override
	public void WorkLogout(HttpSession session) {
		session.invalidate();

		
		
	}

	@Override
	public int getWorkCount() {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.getWorkCount();
	}

	@Override
	public List<Insa_ScheduleDTO> EmpWork(Insa_ScheduleDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.EmpWork();
	}

	@Override
	public List<Insa_ScheduleDTO> EmpWorkList(HashMap map) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.EmpWorkList();
	}

	@Override
	public int getPayCount() {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.getWorkCount();
	}

	@Override
	public List<Insa_SalaryDTO> PayCheck(HashMap map) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.PayCheck();
	}

	@Override
	public int HollydayAdd(Insa_SalaryDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
			return insaDAO.HollydayAdd(dto);


	}

	@Override
	public Insa_SalaryDTO SelectNum(String salary_empRegister_empnum) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("salary_empRegister_empnum", salary_empRegister_empnum);
		System.out.println("map입니다" + map);
		return insaDAO.SelectNum(map);
	}

	@Override
	public List<Insa_SalaryDTO> Schedule() {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		
		return insaDAO.Schedule();
	}

}