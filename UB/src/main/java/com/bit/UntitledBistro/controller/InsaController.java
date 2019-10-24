package com.bit.UntitledBistro.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.model.insa.Insa_SalaryDTO;
import com.bit.UntitledBistro.model.insa.Insa_ScheduleDTO;
import com.bit.UntitledBistro.service.insa.InsaService;

@Controller
@RequestMapping(value = "/insa")
public class InsaController {
	
	@Resource(name = "test")
	InsaService insaService;
	private Logger logger = LoggerFactory.getLogger(InsaController.class);

	@RequestMapping("/EmpRegisterInsertForm")
	public String insertform() {
		
		return "views/insa/EmpRegisterInsertForm";
	}// ModelAndView�? 리턴?�는것과 같음

	@RequestMapping(value="/EmpRegisterInsert" , method = RequestMethod.POST )
	@ResponseBody
	public int insert(Insa_EmpRegisterDTO dto, MultipartHttpServletRequest mRequest) {
		String fileName = insaService.imgUpload(mRequest);
		dto.setEmpregister_photo(fileName);

		return insaService.EmpRegisterInsert(dto);

	}

	@RequestMapping("/EmpRegisterRead")
	public String read(String empregister_empnum, Model model) {
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);
		
		return "views/insa/EmpRegisterRead";

	}

	@RequestMapping("/EmpRegisterUpdateForm")
	public String updateform(String empregister_empnum, Model model) {
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);

		return "views/insa/EmpRegisterUpdateForm";

	}

	@RequestMapping(value = "/EmpRegisterUpdate",  method = RequestMethod.POST )
	public int update(Insa_EmpRegisterDTO dto) {

		return insaService.EmpRegisterUpdate(dto);

	}

	@RequestMapping("/EmpRegisterList")
	public String list(Model model) {
		List<Insa_EmpRegisterDTO> EmpRegisterList = insaService.EmpRegisterList(new HashMap());
		model.addAttribute("EmpRegisterList", EmpRegisterList);

		return "insa/EmpRegisterList"; // list.jsp

	}

	@RequestMapping("/Schedule")
	public String insa_formcalendar(Model model) {
		model.addAttribute("Schedule", insaService.Schedule());
		
		return "insa/Schedule";
	}

	@RequestMapping(value = "/nck") // ?�약 ?�인 ?�이지�? 보내?? 맵핑
	public String insa_formCkCalendar(@RequestParam("salary_empRegister_empnum") String salary_empRegister_empnum, Model model) {
		model.addAttribute("Schedule", insaService.SelectNum(salary_empRegister_empnum));
		
		return "/views/insa/HollydayList";
	}

	@RequestMapping(value = "/Hollyday") // ?�약 ?�창?�로 보내?? 맵핑
	public String insa_formnewCalendar(Model model) {
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String date = SDF.format(new Date());
		model.addAttribute("date", date);
		
		return "/views/insa/Hollyday";
	}

	@RequestMapping(value = "/HollydayAdd", method = RequestMethod.POST) // ?�약 추�? 맵핑
	@ResponseBody
	public int HollydayAdd(Insa_SalaryDTO dto) {
		
		return insaService.HollydayAdd(dto);
	}

	@RequestMapping("/WorkManagementForm")
	public String WorkManagement() {
		
		return "views/insa/WorkManagementForm";
	}

	@RequestMapping(value = "/WorkCheck", method = RequestMethod.POST)
	@ResponseBody
	public int WorkManagement(@RequestBody Insa_EmpRegisterDTO dto) throws ParseException {
		
		return insaService.WorkCheck(dto);
	}

	@RequestMapping("/WorkLoginCheck")
	public String WorkHome() {
		
		return "views/insa/WorkAdd";
	}

	@RequestMapping(value = "/EmpWork")
	public @ResponseBody Object getRecordList(@ModelAttribute("Insa_ScheduleDTO") Insa_ScheduleDTO dto) {
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", insaService.EmpWork(dto));
		Object result = mp;

		return result;
	}

	@RequestMapping("/EmpWorkList")
	public String Worklist(Model model) {
		List<Insa_ScheduleDTO> EmpWorkList = insaService.EmpWorkList(new HashMap());
		model.addAttribute("EmpWorkList", EmpWorkList);

		return "insa/EmpWorkList"; // list.jsp

	}

	@RequestMapping("/PayCheck")
	public String PayCheck(Model model) {
		List<Insa_SalaryDTO> PayCheck = insaService.PayCheck(new HashMap());
		model.addAttribute("PayCheck", PayCheck);

		return "insa/PayCheck"; // list.jsp

	}

}
