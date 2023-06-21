package ww.upload.controller;

import java.io.File;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.*;
import jakarta.servlet.http.*;
import jakarta.persistence.*;
import ww.upload.model.*;
import ww.member.vo.*;
import ww.pre_weather.model.JpaWeatherRepository;
import ww.pre_weather.vo.Preweather;
import ww.upload.vo.*;
import java.nio.charset.Charset;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import org.apache.commons.codec.binary.Base64;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.List;


@Controller
public class UploadController {
	@Autowired
	private JpaUploadRepository jpaUpload;
	@Autowired
	private JpaWeatherRepository jpaWeather;
	@ResponseBody	
	@RequestMapping(value="/uploadListControl", method=RequestMethod.POST)
	
	public String uploadList(HttpServletRequest request) {
	
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getI_text();
		
	}
	
	@ResponseBody	
	@RequestMapping(value="/uploadIdControl", method=RequestMethod.POST)
	
	public String uploadID(HttpServletRequest request) {
		
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getId();
		
	}
	
	@ResponseBody	
	@RequestMapping(value="/uploadDayControl", method=RequestMethod.POST)
	
	public String uploadDate(HttpServletRequest request) {
		
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getI_day();
		
	}
	
	@RequestMapping(value = "/uploadControl", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam("product_image") MultipartFile multipartFile, Upload upload,
			HttpServletRequest request) throws Exception {
//		System.out.println("multipartFile=" + multipartFile);
		HttpSession session = request.getSession();
		Member login_member = (Member) session.getAttribute("login_member");
		String sid = login_member.getId();
		String file_real_path = request.getSession().getServletContext().getRealPath("/my_file");
//		System.out.println("file_real_path=" + file_real_path);
		String filename = multipartFile.getOriginalFilename();
		long Time = System.currentTimeMillis();
//		System.out.println("Time=" + Time);
		String file_id = Long.toString(Time);
		filename = file_id + "_" + filename;
		String copyLocation = file_real_path + "/" + filename;
//		System.out.println("copyLocation=" + copyLocation);
//		System.out.println("multipartFile.getOriginalFilename()=" + multipartFile.getOriginalFilename());
		// multipartFile.isEmpty() : 업로드 안했을때 true
		upload.setImage(filename);
		upload.setId(sid);
		
//		System.out.println("upload=" + upload);
		//이미지 내용 리턴
		byte[] encodeBase64 = Base64.encodeBase64(multipartFile.getBytes());
		//문자열로 변환
		 String image_data = "image/jpeg;base64," + new String(encodeBase64, "UTF-8");
//		 System.out.println("image_data="+image_data);
		
		// 접속 할 Rest 서버의 url 설정
		HttpPost httpPost = new HttpPost("http://localhost:5000/yolo");
		// 전송할 데이터 타입 설정
		httpPost.addHeader("Content-Type", "application/json");
		// 리턴 받을 데이터 타입 설정
		httpPost.setHeader("Accept", "application/json");
		// 캠 화면 이미지 저장
		StringEntity stringEntity = new StringEntity(image_data);
		// Rest Server로 전송할 객체 생성
		httpPost.setEntity(stringEntity);
		// Rest 서버의 함수를 호출할 객체 생성
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// Rest 서버의 함수를 호출하고 리턴값을 가져올 객체 생성
		CloseableHttpResponse response2 = httpclient.execute(httpPost);
		// EntityUtils.toString(); : Rest Server의 리턴값을 String으로 변환해서 yolo_message 변수에 저장
		String yolo_message = EntityUtils.toString(response2.getEntity(), Charset.forName("UTF-8"));
//		System.out.println("yolo_message=" + yolo_message);
        JSONArray jsonArray = new JSONArray(yolo_message);
        int maxClsCount = Math.min(jsonArray.length(), 2);
        System.out.println(image_data);
        List<String> category = new ArrayList<>();
        for (int i = 0; i < maxClsCount; i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            int cls = jsonObject.getInt("cls");
			String clsString = String.valueOf(cls);
			System.out.println("clsString = " + clsString);
			
			category.add(clsString);
			System.out.println("category = " + category);
			
        }
        JSONArray json = new JSONArray(category);
        String categoryJson = json.toString();
        upload.setCategory(categoryJson);
	    System.out.println("upload="+upload);
	    multipartFile.transferTo(new File(copyLocation));
		
		
		System.out.println("upload="+upload);
		ModelAndView mav = new ModelAndView();
		
		List<String> c_list = new ArrayList<>();
		String findCategory = upload.getCategory();
		c_list.add(findCategory);
		System.out.println("c_list = " + c_list);
		
		upload.setImage(filename);
		upload.setId(sid);
		String w_local = upload.getI_local();
		String w_date = upload.getI_day();
		
		List<Preweather> preweatherList = jpaWeather.findByWList(w_local, w_date);
		System.out.println("preweatherList="+preweatherList);
		for (Preweather preweather : preweatherList) {
		    upload.setLabel(preweather.getW_label());
		}
		jpaUpload.save(upload);
		
		mav.addObject("c_list", c_list);
		mav.setViewName("redirect:/main.jsp");
		return mav;
	}
	
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView uploadForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		return mav;
	}
	
	

}
