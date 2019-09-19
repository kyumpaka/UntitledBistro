package com.bit.UntitledBistro.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;
import com.bit.UntitledBistro.service.jumun.JumunService;

@Controller
@RequestMapping("/jumun")
public class JumunController {
	
	@Autowired
	private JumunService jumunService;
	private static final Logger logger = LoggerFactory.getLogger(JumunController.class);
	
	@RequestMapping(value = "/menuSetting.do")
	public String menuSettingSearch(@ModelAttribute("mt_Code") String mt_Code, Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumunService.menuSearch(mt_Code));		

		return "jumun/menuSetting";
	}
	
	@RequestMapping(value = "/menuTypeAddForm.do")
	public String menuTypeAddForm() {
		return "views/jumun/menuTypeAddForm";
	}
	
	@RequestMapping(value = "/menuTypeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeAdd(@RequestBody MenuTypeDTO menuTypeDTO, RedirectAttributes attr) {
		return jumunService.menuTypeAdd(menuTypeDTO);
	}
	
	@RequestMapping(value = "/menuTypeList.do")
	public String menuTypeList(Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		
		return "views/jumun/menuTypeList";
	}
	
	@RequestMapping(value = "/menuTypeRemove.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeRemove(HttpServletRequest request) {
		String[] mt_CodeList = request.getParameterValues("mt_Code");
		return jumunService.menuTypeRemove(mt_CodeList);
	}
	
	@RequestMapping(value = "/menuTypeModi.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeModi(@RequestBody MenuTypeDTO menuTypeDTO) {
		return jumunService.menuTypeModi(menuTypeDTO);
	}
	
	@RequestMapping(value = "/menuAddForm.do")
	public String menuAddForm(Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		
		return "views/jumun/menuAddForm";
	}
	
	@RequestMapping(value = "/menuAdd.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuAdd(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumunService.imgUpload(mRequest);
		menuDTO.setMenu_Image(fileName);
		
		return jumunService.menuAdd(menuDTO);
	}
	
	@RequestMapping(value = "/menuRemove.do", method = RequestMethod.POST)
	public String menuRemove(RedirectAttributes attr, HttpServletRequest request) {
		String[] list = request.getParameterValues("menu_Code");
		attr.addFlashAttribute("result", jumunService.menuRemove(list));
		
		return "redirect:menuSetting.do";
	}
	
	@RequestMapping(value = "/menuModiForm.do")
	public String menuModiForm(HttpServletRequest request, Model model) {
		String menu_Code = request.getParameter("menu_Code");
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuDTO", jumunService.menuSearchByMenuCode(menu_Code));
		
		return "views/jumun/menuModiForm";
	}
	
	@RequestMapping(value = "/menuModi.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int menuModi(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumunService.imgUpload(mRequest);
		if(fileName == null) fileName = "없음.jpg";
		menuDTO.setMenu_Image(fileName);
		
		return jumunService.menuModi(menuDTO);
	}
	
	@RequestMapping(value = "/ingreSearchByMenuCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(HttpServletRequest request) {
		String menu_Code = request.getParameter("menu_Code");

		return jumunService.ingreSearchByMenuCode(menu_Code);
	}
	
	@RequestMapping(value = "/tableSetting.do")
	public String tableSetting(Model model) {
		model.addAttribute("tableList", jumunService.tableSearch());
		
		return "jumun/tableSetting";
	}
	
	@RequestMapping(value = "/tableSave.do", method = RequestMethod.POST)
	@ResponseBody
	public int tableSave(@RequestBody List<TableSaveDTO> list) {
		return jumunService.tableAdd(list);
	}
	
	@RequestMapping(value = "/posMain.do")
	public String posMain(Model model) {
		model.addAttribute("tableList", jumunService.tableSearch());
		
		return "views/jumun/posMain";
	}
	
	@RequestMapping(value = "/orderList.do")
	public String orderList(OrderDTO orderDTO, Model model, HttpServletRequest request) {
//		model.addAttribute("orderList", MenuSettingService.orderList(orderDTO));
		String mt_Code = request.getParameter("mt_Code");
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumunService.menuSearch(mt_Code));
		
		return "views/jumun/orderList";
	}
	
}
