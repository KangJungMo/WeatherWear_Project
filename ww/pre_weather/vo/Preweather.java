package ww.pre_weather.vo;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "preweather")
public class Preweather {
	@Id
	private Integer w_num;
	private String w_local;
	private String w_date;
	private Integer w_label;
	
	public Integer getW_num() {
		return w_num;
	}
	public void setW_num(Integer w_num) {
		this.w_num = w_num;
	}
	public String getW_local() {
		return w_local;
	}
	public void setW_local(String w_local) {
		this.w_local = w_local;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public Integer getW_label() {
		return w_label;
	}
	public void setW_label(Integer w_label) {
		this.w_label = w_label;
	}
	@Override
	public String toString() {
		return "Preweather [w_local=" + w_local + ", w_date=" + w_date + ", w_label=" + w_label + "]";
	}
	
	
}
