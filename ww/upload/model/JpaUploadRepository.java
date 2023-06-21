package ww.upload.model;

import java.util.*;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;

import ww.upload.vo.*;

@Repository
public interface JpaUploadRepository extends JpaRepository<Upload, String>{
	public List <Upload> findByImage(String image);
	@Query(value = "select u from upload u where id=?1")
	public List<Upload> findByUserId(String id);
	@Query(value = "select u from upload u where label=?1")
	public List<Upload> findByLabel(Integer label);
	List<Upload> findByCategoryContaining(String category);

}
