package ww.featureweather.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import ww.featureweather.model.JpaFeatureWeatherRepository;
import ww.featureweather.vo.FeatureWeather;
import ww.upload.model.*;
import ww.upload.vo.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FeatureWeatherController {
	@Autowired
	private JpaFeatureWeatherRepository jpafeature;
	
	@RequestMapping("/featureControl0")
	public ModelAndView WeatherForm0() {
		
		List<FeatureWeather> list = jpafeature.findByLabel(0);
		System.out.println("labelList="+list);
		List<Integer> l_list = new ArrayList<>();
		for(FeatureWeather featureweather : list) {
			int label = featureweather.getLabel();
			l_list.add(label);
			System.out.println("l_list="+l_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("label", l_list);
		mav.setViewName("label0.jsp");
		return mav;
		
	}
	
	@RequestMapping("/featureControl7")
	public ModelAndView WeatherForm7() {
		List<FeatureWeather> list = jpafeature.findByLabel(7);
		System.out.println("labelList="+list);
		List<Integer> l_list = new ArrayList<>();
		for(FeatureWeather featureweather : list) {
			int label = featureweather.getLabel();
			l_list.add(label);
			System.out.println("l_list="+l_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("label", l_list);
		mav.setViewName("label7.jsp");
		return mav;
		
	}
}
