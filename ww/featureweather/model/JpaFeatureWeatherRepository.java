package ww.featureweather.model;

import java.util.*;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;

import ww.featureweather.vo.*;


@Repository
public interface JpaFeatureWeatherRepository extends JpaRepository<FeatureWeather, Integer>{
	@Query(value = "select w from featureweather w where w.area=?1 and w.day=?2")
	public List<FeatureWeather> findByWList(String area, String day);
	List<FeatureWeather> findByLabel(Integer label);
}
