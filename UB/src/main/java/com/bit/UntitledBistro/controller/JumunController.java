package com.bit.UntitledBistro.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.UntitledBistro.model.jumun.Jumun_IngredientDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_OrderDTO;
import com.bit.UntitledBistro.service.jumun.Jumun_JumunService;

@Controller
@RequestMapping("/jumun")
public class JumunController {
	
	@Autowired
	private Jumun_JumunService jumun_MenuSettingService;
	private static final Logger logger = LoggerFactory.getLogger(JumunController.class);
	
	@RequestMapping("/menuSetting.do")
	public String menuSettingSearch(@ModelAttribute("mt_Code") String mt_Code, Model model) {
		model.addAttribute("menuTypeList", jumun_MenuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumun_MenuSettingService.menuSearch(mt_Code));		

		return "views/jumun/jumun_menuSetting";
	}
	
	@RequestMapping("/menuTypeAddForm.do")
	public String menuTypeAddForm() {
		return "views/jumun/jumun_menuTypeAddForm";
	}
	
	@RequestMapping(value = "/menuTypeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeAdd(@RequestBody Jumun_MenuTypeDTO menuTypeDTO, RedirectAttributes attr) {
		return jumun_MenuSettingService.menuTypeAdd(menuTypeDTO);
	}
	
	@RequestMapping("/menuTypeList.do")
	public String menuTypeList(Model model) {
		model.addAttribute("menuTypeList", jumun_MenuSettingService.menuTypeSearch("all"));
		
		return "views/jumun/jumun_menuTypeList";
	}
	
	@RequestMapping("/menuTypeRemove.do")
	@ResponseBody
	public int menuTypeRemove(HttpServletRequest request) {
		String[] mt_CodeList = request.getParameterValues("mt_Code");
		return jumun_MenuSettingService.menuTypeRemove(mt_CodeList);
	}
	
	@RequestMapping(value = "/menuTypeModi.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeModi(@RequestBody Jumun_MenuTypeDTO menuTypeDTO) {
		return jumun_MenuSettingService.menuTypeModi(menuTypeDTO);
	}
	
	@RequestMapping("/menuSearch.do")
	public String menuSearch(HttpServletRequest request, Model model) {
		String menu_Code = request.getParameter("menu_Code");
		model.addAttribute("menuDTO", jumun_MenuSettingService.menuSearchByMenuCode(menu_Code));
		
		return "views/jumun/jumun_menuSetting";
	}
	
	@RequestMapping("/menuAddForm.do")
	public String menuAddForm(Model model) {
		model.addAttribute("menuTypeList", jumun_MenuSettingService.menuTypeSearch("all"));
		
		return "views/jumun/jumun_menuAddForm";
	}
	
	@RequestMapping(value = "/menuAdd.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuAdd(Jumun_MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumun_MenuSettingService.imgUpload(mRequest);
		menuDTO.setMenu_Image(fileName);
		
		return jumun_MenuSettingService.menuAdd(menuDTO);
	}
	
	@RequestMapping("/menuRemove.do")
	public String menuRemove(RedirectAttributes attr, HttpServletRequest request) {
		String[] list = request.getParameterValues("menu_Code");
		attr.addFlashAttribute("result", jumun_MenuSettingService.menuRemove(list));
		
		return "redirect:menuSetting.do";
	}
	
	@RequestMapping("/menuModiForm.do")
	public String menuModiForm(HttpServletRequest request, Model model) {
		String menu_Code = request.getParameter("menu_Code");
		model.addAttribute("menuTypeList", jumun_MenuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuDTO", jumun_MenuSettingService.menuSearchByMenuCode(menu_Code));
		
		return "views/jumun/jumun_menuModiForm";
	}
	
	@RequestMapping(value = "/menuModi.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuModi(Jumun_MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumun_MenuSettingService.imgUpload(mRequest);
		if(fileName == null) fileName = "없음.jpg";
		menuDTO.setMenu_Image(fileName);
		
		return jumun_MenuSettingService.menuModi(menuDTO);
	}
	
	@RequestMapping("/ingreSearchByMenuCode.do")
	@ResponseBody
	public ArrayList<Jumun_IngredientDTO> ingreSearchByMenuCode(HttpServletRequest request) {
		String menu_Code = request.getParameter("menu_Code");

		return jumun_MenuSettingService.ingreSearchByMenuCode(menu_Code);
	}
	
	@RequestMapping("/orderList.do")
	public String orderList(Jumun_OrderDTO orderDTO, Model model, HttpServletRequest request) {
		model.addAttribute("orderList", jumun_MenuSettingService.orderList(orderDTO));
		String mt_Code = request.getParameter("mt_Code");
		model.addAttribute("menuTypeList", jumun_MenuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumun_MenuSettingService.menuSearch(mt_Code));
		
		return "views/jumun/orderList";
	}
	
	@RequestMapping("/posMain.do")
	public String posMain() {
		return "views/jumun/posMain";
	}
	
}
