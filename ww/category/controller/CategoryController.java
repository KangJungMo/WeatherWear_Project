package ww.category.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import ww.upload.model.*;
import ww.upload.vo.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CategoryController {
	@Autowired
	private JpaUploadRepository jpaUpload;

	@RequestMapping("/categoryControl0")
	public ModelAndView CategoryForm0() {

		List<Upload> list = jpaUpload.findByCategoryContaining("0");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category0.jsp");
		return mav;
	}

	@RequestMapping(value = "/categoryControl1")
	public ModelAndView CategoryForm1() {

		List<Upload> list = jpaUpload.findByCategoryContaining("1");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category1.jsp");
		return mav;
	}

	@RequestMapping(value = "/categoryControl2")
	public ModelAndView CategoryForm2() {

		List<Upload> list = jpaUpload.findByCategoryContaining("2");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category2.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl3")
	public ModelAndView CategoryForm3() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("3");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category3.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl4")
	public ModelAndView CategoryForm4() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("4");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category4.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl5")
	public ModelAndView CategoryForm5() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("5");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category5.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl6")
	public ModelAndView CategoryForm6() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("6");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category6.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl7")
	public ModelAndView CategoryForm7() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("7");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category7.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl8")
	public ModelAndView CategoryForm8() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("8");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category8.jsp");
		return mav;
	}
	@RequestMapping(value = "/categoryControl9")
	public ModelAndView CategoryForm9() {
		
		List<Upload> list = jpaUpload.findByCategoryContaining("9");
		System.out.println("categoryList = " + list);
		List<String> c_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			c_list.add(image);
			System.out.println("c_list = " + c_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", c_list);
		mav.setViewName("category9.jsp");
		return mav;
	}
}
