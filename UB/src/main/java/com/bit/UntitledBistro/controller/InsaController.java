package com.bit.UntitledBistro.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.model.insa.Insa_SalaryDTO;
import com.bit.UntitledBistro.model.insa.Insa_ScheduleDTO;
import com.bit.UntitledBistro.service.insa.GoogleCalendarService;
import com.bit.UntitledBistro.service.insa.InsaService;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.calendar.model.Events;

@Controller()
@RequestMapping(value = "/insa")

public class InsaController {
	@Resource(name = "test")
	InsaService insaService;
	private Logger logger = LoggerFactory.getLogger(InsaController.class);

	@RequestMapping("/EmpRegisterInsertForm")
	public String insertform() {
		return "views/insa/EmpRegisterInsertForm";
	}// ModelAndView瑜� 由ы꽩�븯�뒗寃껉낵 媛숈쓬

	@RequestMapping("/EmpRegisterInsert")
	@ResponseBody
	public int insert(Insa_EmpRegisterDTO dto, MultipartHttpServletRequest mRequest) {
//		insaService.EmpRegisterInsert(dto);
		String fileName = insaService.imgUpload(mRequest);
		dto.setEmpregister_photo(fileName);

		// return "insaService.EmpRegisterInsert(dto)";
		return insaService.EmpRegisterInsert(dto);

	}

	@RequestMapping("/EmpRegisterRead")
	public String read(String empregister_empnum, Model model) {
		System.out.println("===================== 11");
		System.out.println(empregister_empnum);
		System.out.println("===================== 22");
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);
		System.out.println("�뿬湲곌퉴吏��솕�뒿�땲�떎");
		/* model.addAttribute("pg", pg); */
		return "views/insa/EmpRegisterRead";

	}

	@RequestMapping("/EmpRegisterUpdateForm")
	public String updateform(String empregister_empnum, Model model) {
		Insa_EmpRegisterDTO dto = insaService.EmpRegisterRead(empregister_empnum);
		model.addAttribute("b", dto);
		/* model.addAttribute("pg",pg); */

		return "views/insa/EmpRegisterUpdateForm";

	}

	@RequestMapping("EmpRegisterUpdate")
	public String update(Insa_EmpRegisterDTO dto) {
		int result = insaService.EmpRegisterUpdate(dto);
		System.out.println(result);	
		String res = "redirect:/insa/EmpRegisterList";
		if (result == 0) {
			res = "insa/EmpRegisterFail";

		}

		return res;

	}

	@RequestMapping("/EmpRegisterList")
	public String list(HttpServletRequest request) {


		int total = insaService.getEmpCount();

		HashMap map = new HashMap();

		List<Insa_EmpRegisterDTO> EmpRegisterList = insaService.EmpRegisterList(map);
		request.setAttribute("EmpRegisterList", EmpRegisterList);

		return "insa/EmpRegisterList"; // list.jsp

	}

	// 罹섎┛�뜑 �씠�룞泥섎━
	@RequestMapping("/Schedule")
	public String schdule(Model model, String calendarId, String title) {
		logger.info("schdule");
		model.addAttribute("calendarId", calendarId);
		model.addAttribute("title", title);
		return "insa/Schedule";
	}

	@RequestMapping("/calendarAdd")
	public String calendarAdd(Insa_ScheduleDTO ScDto) {
		logger.info("calendarAdd " + ScDto.toString());

		try {
			Calendar service = GoogleCalendarService.getCalendarService();
			com.google.api.services.calendar.model.Calendar calendar = new com.google.api.services.calendar.model.Calendar();
			calendar.setSummary(ScDto.getSummary());
			calendar.setTimeZone("America/Los_Angeles");
			service.calendars().insert(calendar).execute();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "insa/ScheduleCalendar";
	}

	/*
	 * // �씪�젙 ���옣 泥섎━
	 * 
	 * @RequestMapping(value = "/calendarEventAdd", method = RequestMethod.POST)
	 * public Map<String, Boolean> calendarEventAdd(Insa_ScheduleDTO ScDto) {
	 * logger.info("calendarEventAdd " + ScDto.toString());
	 * 
	 * boolean isc = false; try { Calendar service =
	 * GoogleCalendarService.getCalendarService(); Event event = new
	 * Event().setSummary(ScDto.getSummary()).setDescription(ScDto.getDescription())
	 * ; // �떆�옉�씪 DateTime startDateTime = new DateTime(ScDto.getStartDateTime());
	 * EventDateTime start = new
	 * EventDateTime().setDateTime(startDateTime).setTimeZone("America/Los_Angeles")
	 * ; event.setStart(start); // 醫낅즺�씪 DateTime endDateTime = new
	 * DateTime(ScDto.getEndDateTime()); EventDateTime end = new
	 * EventDateTime().setDateTime(endDateTime).setTimeZone("America/Los_Angeles");
	 * event.setEnd(end); event = service.events().insert(ScDto.getCalendarId(),
	 * event).execute(); isc = true; } catch (IOException | ParseException e) {
	 * e.printStackTrace(); } Map<String, Boolean> map = new HashMap<String,
	 * Boolean>(); map.put("isc", isc); return map; }
	 * 
	 * // �씪�젙 �뜲�씠�꽣 泥섎━
	 * 
	 * @RequestMapping(value = "/calendarEventList.do", method = RequestMethod.POST)
	 * public List<Event> calendarEventList(Insa_ScheduleDTO ScDto) {
	 * logger.info("calendarEventList " + ScDto.toString());
	 * 
	 * List<Event> items = new ArrayList<Event>(); try {
	 * com.google.api.services.calendar.Calendar service =
	 * GoogleCalendarService.getCalendarService(); Events events =
	 * service.events().list(ScDto.getCalendarId()).setOrderBy(
	 * "schedule_workingstarttime") .setSingleEvents(true).execute(); items =
	 * events.getItems(); } catch (IOException e) { e.printStackTrace(); } return
	 * items; }
	 */

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		insaService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/insa/InsaLogin");
		mav.addObject("msg", "logout");
		
		return mav; 
		
	}
	
	
	@RequestMapping("/WorkManagementForm")
	public String WorkManagement() {
		logger.info("異쒗눜愿�由� 濡쒓렇�씤");
		return "views/insa/WorkManagementForm";
	}
	
	@RequestMapping(value = "/WorkCheck" , method = RequestMethod.POST)
	@ResponseBody
	public int WorkManagement(@RequestBody Insa_EmpRegisterDTO dto) throws ParseException {
		logger.info("異쒗눜愿�由� 濡쒓렇�씤");
		return insaService.WorkCheck(dto);
	}
	
	@RequestMapping("/WorkLoginCheck")
	public String WorkHome(HttpSession session) {
		logger.info("濡쒓렇�씤 而⑦듃濡ㅻ윭�뿉 �삤�떊嫄� �솚�쁺�빀�땲�떎");
		return "views/insa/WorkAdd";
	}
	@RequestMapping("/WorkLogout")
	public ModelAndView Worklogout(HttpSession session) {
		insaService.WorkLogout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/insa/WorkManagementForm");
		mav.addObject("msg", "WorkLogout");
		
		return mav; 
		
	}
	/*
	 * @RequestMapping("/EmpWork") public String EmpWorklist(HttpServletRequest
	 * request) {
	 * 
	 * 
	 * int total = insaService.getWorkCount();
	 * 
	 * 
	 * 
	 * HashMap map = new HashMap();
	 * 
	 * 
	 * List<Insa_ScheduleDTO> EmpWork = insaService.EmpWork(map);
	 * request.setAttribute("EmpWork", EmpWork);
	 * 
	 * return "insa/EmpWork"; // list.jsp
	 * 
	 * }
	 */
	

@RequestMapping(value = "/EmpWork")
 public @ResponseBody Object getRecordList(HttpServletRequest request,
   HttpServletResponse response,
   @ModelAttribute("Insa_ScheduleDTO") Insa_ScheduleDTO dto){
  
  Map<String, Object> mp = new HashMap<String, Object>();
  mp.put("data", insaService.EmpWork(dto));
  
  Object result = mp;
  
  return result;
}


@RequestMapping("/EmpWorkList")
public String Worklist(HttpServletRequest request) {


	int total = insaService.getWorkCount();
	HashMap map = new HashMap();


	List<Insa_ScheduleDTO> EmpWorkList = insaService.EmpWorkList(map);
	request.setAttribute("EmpWorkList", EmpWorkList);

	return "insa/EmpWorkList"; // list.jsp

}

@RequestMapping("/PayCheck")
public String PayCheck(HttpServletRequest request) {


	int total = insaService.getPayCount();
	HashMap map = new HashMap();


	List<Insa_SalaryDTO> PayCheck = insaService.PayCheck(map);
	request.setAttribute("PayCheck", PayCheck);

	return "insa/PayCheck"; // list.jsp

}


}
