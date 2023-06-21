package ww.view.vo;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "view")
public class View {
	@Id
	private Integer view_num;
	private String view_date;
	private String view_time;
	private String tmp;
	private String wet;
	private String view_area;
	public Integer getView_num() {
		return view_num;
	}
	public void setView_num(Integer view_num) {
		this.view_num = view_num;
	}
	public String getView_date() {
		return view_date;
	}
	public void setView_date(String view_date) {
		this.view_date = view_date;
	}
	public String getView_time() {
		return view_time;
	}
	public void setView_time(String view_time) {
		this.view_time = view_time;
	}
	public String getTmp() {
		return tmp;
	}
	public void setTmp(String tmp) {
		this.tmp = tmp;
	}
	public String getWet() {
		return wet;
	}
	public void setWet(String wet) {
		this.wet = wet;
	}
	public String getView_area() {
		return view_area;
	}
	public void setView_area(String view_area) {
		this.view_area = view_area;
	}
	@Override
	public String toString() {
		return "View [view_num=" + view_num + ", view_date=" + view_date + ", view_time=" + view_time + ", tmp=" + tmp
				+ ", wet=" + wet + ", view_area=" + view_area + "]";
	}
	
	
}
