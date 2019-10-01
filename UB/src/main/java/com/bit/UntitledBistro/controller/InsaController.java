package com.bit.UntitledBistro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Parameter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.insa.InsaDAO;
import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.service.insa.InsaService;

@Controller
public class InsaController {

	@Resource(name = "test")
	private InsaService insaService;

	@RequestMapping("/EmpRegisterInsertForm")
	public String insertform() {
		return "views/insa/EmpRegisterInsertForm";
	}// ModelAndView를 리턴하는것과 같음

	@RequestMapping("/EmpRegisterInsert")
	@ResponseBody
	public int insert(Insa_EmpRegisterDTO dto , MultipartHttpServletRequest mRequest) {
//		insaService.EmpRegisterInsert(dto);
		String fileName = insaService.imgUpload(mRequest);
		dto.setEmpregister_photo(fileName);
		
		
		//return "insaService.EmpRegisterInsert(dto)";
		return insaService.EmpRegisterInsert(dto);

	}
	
	
	@RequestMapping("/EmpRegisterRead")
	public String read(String empregister_empnum,  Model model) {
		System.out.println("===================== 11");
		System.out.println(empregister_empnum);
		System.out.println("===================== 22");
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);
		System.out.println("여기까지왔습니다");
		/* model.addAttribute("pg", pg); */
		return "views/insa/EmpRegisterRead";
		
		
	}
	
	
	@RequestMapping("/EmpRegisterUpdateForm")
	public String updateform(String empregister_empnum, Model model ) {
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);
		/* model.addAttribute("pg",pg); */
		
		
		
		return "views/insa/EmpRegisterUpdateForm";
		
		}
	
	@RequestMapping("EmpRegisterUpdate")
	public String update(Insa_EmpRegisterDTO dto) {
		int result = insaService.EmpRegisterUpdate(dto);
		System.out.println(result);
		String res ="redirect:/insa/EmpRegisterList";
		if(result == 0) {
			res = "insa/EmpRegisterFail";
			
		}
		
		
		return res;
		
		
	}

	@RequestMapping("/EmpRegisterList")
	public String list(HttpServletRequest request) {

		
		  int pg = 1; String strPg = request.getParameter("pg"); if (strPg != null) {
		  pg = Integer.parseInt(strPg);
		  
		  } int rowSize = 10; int start = (pg * rowSize) - (rowSize - 1); int end = pg
		  * rowSize;
		  
		  int total = insaService.getEmpCount(); 
		  System.out.println("시작 : " + start +
		  " 끝:" + end); System.out.println("글의 수 : " + total);
		  
		  int allPage = (int) Math.ceil(total / (double) rowSize);
		  
		  int block = 5; int fromPage = ((pg - 1) / block * block) + 1;
		  
		  int toPage = ((pg - 1) / block * block) + block; if (toPage > allPage) {
		  toPage = allPage;
		  
		  }
		  
		HashMap map = new HashMap();
		 
		map.put("start", start); 
		map.put("end", end);
		 

		List<Insa_EmpRegisterDTO> EmpRegisterList = insaService.EmpRegisterList(map);
		request.setAttribute("EmpRegisterList", EmpRegisterList);
		request.setAttribute("pg",pg);
		request.setAttribute("allPage",allPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);	
		 

		return "insa/EmpRegisterList"; // list.jsp

	}
	

}
