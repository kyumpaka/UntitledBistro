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

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrderDTO;
import com.bit.UntitledBistro.service.jumun.JumunService;

@Controller
@RequestMapping("/jumun")
public class JumunController {
	
	@Autowired
	private JumunService menuSettingService;
	private static final Logger logger = LoggerFactory.getLogger(JumunController.class);
	
	@RequestMapping(value = "/menuSetting.do")
	public String menuSettingSearch(@ModelAttribute("mt_Code") String mt_Code, Model model) {
		model.addAttribute("menuTypeList", menuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuList", menuSettingService.menuSearch(mt_Code));		

		return "jumun/menuSetting";
	}
	
	@RequestMapping(value = "/menuTypeAddForm.do")
	public String menuTypeAddForm() {
		return "views/jumun/menuTypeAddForm";
	}
	
	@RequestMapping(value = "/menuTypeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeAdd(@RequestBody MenuTypeDTO menuTypeDTO, RedirectAttributes attr) {
		return menuSettingService.menuTypeAdd(menuTypeDTO);
	}
	
	@RequestMapping(value = "/menuTypeList.do")
	public String menuTypeList(Model model) {
		model.addAttribute("menuTypeList", menuSettingService.menuTypeSearch("all"));
		
		return "views/jumun/menuTypeList";
	}
	
	@RequestMapping(value = "/menuTypeRemove.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeRemove(HttpServletRequest request) {
		String[] mt_CodeList = request.getParameterValues("mt_Code");
		return menuSettingService.menuTypeRemove(mt_CodeList);
	}
	
	@RequestMapping(value = "/menuTypeModi.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeModi(@RequestBody MenuTypeDTO menuTypeDTO) {
		return menuSettingService.menuTypeModi(menuTypeDTO);
	}
	
	@RequestMapping(value = "/menuAddForm.do")
	public String menuAddForm(Model model) {
		model.addAttribute("menuTypeList", menuSettingService.menuTypeSearch("all"));
		
		return "views/jumun/menuAddForm";
	}
	
	@RequestMapping(value = "/menuAdd.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuAdd(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = menuSettingService.imgUpload(mRequest);
		menuDTO.setMenu_Image(fileName);
		
		return menuSettingService.menuAdd(menuDTO);
	}
	
	@RequestMapping(value = "/menuRemove.do", method = RequestMethod.POST)
	public String menuRemove(RedirectAttributes attr, HttpServletRequest request) {
		String[] list = request.getParameterValues("menu_Code");
		attr.addFlashAttribute("result", menuSettingService.menuRemove(list));
		
		return "redirect:menuSetting.do";
	}
	
	@RequestMapping(value = "/menuModiForm.do")
	public String menuModiForm(HttpServletRequest request, Model model) {
		String menu_Code = request.getParameter("menu_Code");
		model.addAttribute("menuTypeList", menuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuDTO", menuSettingService.menuSearchByMenuCode(menu_Code));
		
		return "views/jumun/menuModiForm";
	}
	
	@RequestMapping(value = "/menuModi.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuModi(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = menuSettingService.imgUpload(mRequest);
		if(fileName == null) fileName = "없음.jpg";
		menuDTO.setMenu_Image(fileName);
		
		return menuSettingService.menuModi(menuDTO);
	}
	
	@RequestMapping(value = "/ingreSearchByMenuCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(HttpServletRequest request) {
		String menu_Code = request.getParameter("menu_Code");

		return menuSettingService.ingreSearchByMenuCode(menu_Code);
	}
	
	@RequestMapping(value = "/tableSetting.do")
	public String tableSetting() {
		return "jumun/tableSetting";
	}
	
	@RequestMapping(value = "/orderList.do")
	public String orderList(OrderDTO orderDTO, Model model, HttpServletRequest request) {
//		model.addAttribute("orderList", MenuSettingService.orderList(orderDTO));
		String mt_Code = request.getParameter("mt_Code");
		model.addAttribute("menuTypeList", menuSettingService.menuTypeSearch("all"));
		model.addAttribute("menuList", menuSettingService.menuSearch(mt_Code));
		
		return "views/jumun/orderList";
	}
	
	@RequestMapping(value = "/posMain.do")
	public String posMain() {
		return "views/jumun/posMain";
	}
	
}
