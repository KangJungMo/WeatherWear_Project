package ww.member.model;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;
import ww.member.vo.*;

@Repository
public interface JpaMemberRepository extends JpaRepository<Member, String> {
	
}
