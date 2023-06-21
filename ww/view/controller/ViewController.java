package ww.view.controller;

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.*;
import org.json.*;

import jakarta.servlet.http.*;
import jakarta.persistence.*;
import ww.upload.model.*;
import ww.featureweather.model.*;
import ww.featureweather.vo.FeatureWeather;
import ww.member.vo.*;
import ww.upload.vo.*;
import ww.view.vo.*;
import ww.view.vo.View;
import ww.view.model.*;
import ww.pre_weather.model.JpaWeatherRepository;
import ww.pre_weather.vo.*;
import java.nio.file.StandardCopyOption;

@Controller
public class ViewController {
	@Autowired
	private JpaViewRepository jpaView;
	@Autowired
	private JpaFeatureWeatherRepository jpaFeature;
	@Autowired
	private JpaUploadRepository uploadRepository;
	
	@ResponseBody
	@RequestMapping(value="/viewControl", method=RequestMethod.POST)
	public String view(View data) throws Exception{

		System.out.println("data="+data);
		List v_list = jpaView.findVList(data.getView_area(), data.getView_date());
		List f_list = jpaFeature.findByWList(data.getView_area(), data.getView_date());
		
		FeatureWeather weather = (FeatureWeather)f_list.get(0);
		List i_list = uploadRepository.findByLabel(weather.getLabel());
		System.out.println("f_list="+f_list);
		System.out.println("v_list="+v_list);
		System.out.println("i_list="+i_list);
		
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("tmp", new JSONObject(f_list.get(0)));
		jsonObject.put("i_list", new JSONArray(i_list));
		jsonObject.put("v_list",new JSONArray (v_list));		
		return jsonObject.toString();
		
	}
	
}
