package ww.upload.vo;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
@Entity(name = "upload")	
public class Upload {
	
	private String id;
	private String i_local;
	private String i_day;
	private String gender;
	private String i_text;
	@Id
	private String image;
	private String category;
	private Integer label;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getI_local() {
		return i_local;
	}
	public void setI_local(String i_local) {
		this.i_local = i_local;
	}
	public String getI_day() {
		return i_day;
	}
	public void setI_day(String i_day) {
		this.i_day = i_day;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getI_text() {
		return i_text;
	}
	public void setI_text(String i_text) {
		this.i_text = i_text;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getLabel() {
		return label;
	}
	public void setLabel(Integer label) {
		this.label = label;
	}
	@Override
	public String toString() {
		return "Upload [id=" + id + ", i_local=" + i_local + ", i_day=" + i_day + ", gender=" + gender + ", i_text="
				+ i_text + ", image=" + image + ", category=" + category + ", label=" + label + "]";
	}
	
	
	
	
}
