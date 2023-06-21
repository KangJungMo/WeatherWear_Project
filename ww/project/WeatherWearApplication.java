package ww.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"ww.member", "ww.upload"})
public class WeatherWearApplication {

	public static void main(String[] args) {
		SpringApplication.run(WeatherWearApplication.class, args);
	}

}
