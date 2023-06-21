package ww.pre_weather.model;

import java.util.*;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;

import ww.pre_weather.vo.*;




@Repository
public interface JpaWeatherRepository extends JpaRepository<Preweather, Integer>{
	
	@Query(value = "select w from preweather w where w.w_local=?1 and w.w_date=?2")
	public List<Preweather> findByWList(String w_local, String w_date);
	
}
