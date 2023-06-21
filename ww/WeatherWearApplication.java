package ww;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;

@SpringBootApplication
@EntityScan(basePackages = {"ww.member.vo", "ww.upload.vo", "ww.pre_weather.vo", "ww.featureweather.vo","ww.view.vo"})
@EnableJpaRepositories(basePackages = {"ww.member.model", "ww.upload.model", "ww.pre_weather.model", "ww.featureweather.model", "ww.view.model"})
@ComponentScan(basePackages = {"ww.member.controller", "ww.upload.controller","ww.mypage.controller","ww.yolo.controller", "ww.featureweather.controller", "ww.view.controller", "ww.category.controller"})
public class WeatherWearApplication {

	public static void main(String[] args) {
		SpringApplication.run(WeatherWearApplication.class, args);
	}

}
