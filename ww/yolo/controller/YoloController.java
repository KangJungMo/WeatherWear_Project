package ww.yolo.controller;


import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.*;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.entity.*;
import org.json.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.io.File;
import jakarta.servlet.http.*;
import jakarta.persistence.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.multipart.MultipartFile;
import org.json.JSONArray;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
@Controller
public class YoloController {
	@ResponseBody
	@RequestMapping(value = "/weatherControl", method = RequestMethod.POST)
	public String weather(@RequestBody String data) throws Exception {
		System.out.println("weather control start!!!");
		System.out.println("data=" + data);
		JSONObject dataObject = new JSONObject(data);
		System.out.println("dataObject=" + dataObject);
		// dataObject를 리스트로 변환
		List<String> dataList = new ArrayList<>();
		Iterator<String> keys = dataObject.keys();
		while (keys.hasNext()) {
			String key = keys.next();
			String value = dataObject.getString(key);
			dataList.add(value);
		}
		// 리스트를 JSON 배열로 변환
		JSONArray jsonArray = new JSONArray(dataList);
		// JSON 배열을 문자열로 변환
		String jsonString = jsonArray.toString();
		// StringEntity 생성
		StringEntity entity = new StringEntity(jsonString, StandardCharsets.UTF_8);
		// HTTP POST 요청 생성
		HttpPost httpPost = new HttpPost("http://localhost:5000/weather");
		httpPost.setEntity(entity);
		httpPost.setHeader("Content-Type", "application/json");
		// HTTP 클라이언트 생성 및 요청 전송
		try (CloseableHttpClient httpClient = HttpClients.createDefault();
				CloseableHttpResponse response = httpClient.execute(httpPost)) {
			// 응답 처리
			HttpEntity responseEntity = response.getEntity();
			String responseString = EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
			System.out.println("응답 바디: " + responseString);
			return responseString;
		}
	}
}