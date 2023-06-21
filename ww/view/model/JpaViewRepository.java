package ww.view.model;

import java.util.*;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.*;

import ww.view.vo.*;

@Repository
public interface JpaViewRepository extends JpaRepository<View, Integer> {
	@Query(
		value = "select * from view v where v.view_area=:view_area and v.view_date=:view_date and mod( cast(v.view_time as unsigned ) , 3) =0",
		nativeQuery = true)
	public List<View> findVList(@Param("view_area")String view_area,@Param("view_date") String view_date);
}
