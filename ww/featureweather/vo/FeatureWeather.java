package ww.featureweather.vo;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name="featureweather")
public class FeatureWeather {

	@Id
	private Integer num;
	private String area;
	private String day;
	private Integer label;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Integer getLabel() {
		return label;
	}
	public void setLabel(Integer label) {
		this.label = label;
	}
	@Override
	public String toString() {
		return "FeatureWeather [num=" + num + ", area=" + area + ", day=" + day + ", label=" + label + "]";
	}
	
	
}
