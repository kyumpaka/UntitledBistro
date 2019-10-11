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
	public int getEmpCount() {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);

		return insaDAO.getEmpCount();
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
				}

				byte[] data = mFile.getBytes();
				FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
				System.out.println("uploadPath  : " + uploadPath );
				fos.write(data);
				fos.close();
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
	public Insa_EmpRegisterDTO viewMember(Insa_EmpRegisterDTO dto) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		return insaDAO.viewMember(dto);
	}

	@Override
	public boolean InsaLoginCheck(Insa_EmpRegisterDTO dto, HttpSession session) {
		InsaDAO insaDAO = sqlsession.getMapper(InsaDAO.class);
		String name = insaDAO.InsaLoginCheck(dto);
		boolean result = false;
		
		if(name != null) result = true;
		if(result) {
			Insa_EmpRegisterDTO dto2 = viewMember(dto);
			
			System.out.println("num : " + dto2.getEmpregister_empnum());
			System.out.println("name : " + dto2.getEmpregister_name());
			System.out.println("photo : " + dto2.getEmpregister_photo());
			session.setAttribute("empregister_empnum", dto2.getEmpregister_empnum());
			session.setAttribute("empregister_name", dto2.getEmpregister_name());
			session.setAttribute("empregister_photo", dto2.getEmpregister_photo());
		}
		
		
			
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		
		session.invalidate();
		
	}


}