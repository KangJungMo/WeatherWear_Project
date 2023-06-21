package ww.mypage.controller;


import java.io.File;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.*;
import jakarta.servlet.http.*;
import jakarta.persistence.*;
import ww.upload.model.*;
import ww.member.model.*;
import ww.member.vo.*;
import ww.upload.vo.*;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
@Controller
public class MypageController {
	@Autowired
	private JpaUploadRepository jpaUpload;
	@Autowired
	private JpaMemberRepository jpaMember;
	@RequestMapping(value = "/myPageControl", method = RequestMethod.GET)
	public ModelAndView myList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member login_member = (Member) session.getAttribute("login_member");
		String sid = login_member.getId();
		System.out.println(sid);
		List<Upload> list = jpaUpload.findByUserId(sid);
		System.out.println(list);
		List<String> i_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			i_list.add(image);
			System.out.println(i_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage.jsp");
		mav.addObject("image", i_list);
		mav.addObject("myId", sid);
		System.out.println(i_list);
		return mav;
	}
	@RequestMapping(value = "/deleteMypageControl", method = RequestMethod.GET)
	public ModelAndView deleteImage(HttpServletRequest request) {
		String image = request.getParameter("filename");
		System.out.println("image =" + image);
		jpaUpload.deleteById(image);
		String file_real_path = request.getSession().getServletContext().getRealPath("/my_file");
		File fileToDelete = new File(file_real_path, image);
		if (fileToDelete.exists()) {
			if (fileToDelete.delete()) {
				System.out.println("파일이 성공적으로 삭제되었습니다.");
			} else {
				System.out.println("파일 삭제에 실패했습니다.");
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage.jsp");
		return mav;
	}
	@RequestMapping(value = "/updateMemberControl")
    public ModelAndView updateMemberForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member login_member = (Member) session.getAttribute("login_member");
		String sid = login_member.getId();
        System.out.println("sid = " + sid);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("updateMember.jsp");
        return mav;
    }
	@RequestMapping(value="/updateMemberControl", method=RequestMethod.POST)
	public ModelAndView updateMember(Member mem, HttpSession session) throws Exception {
		System.out.println("mem="+mem);
		Member loginMember =(Member) session.getAttribute("login_member");
		System.out.println("loginMember="+loginMember);
		
		String input_pw = mem.getPw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encode_pw = encoder.encode(input_pw);
		loginMember.setPw(encode_pw);
		loginMember.setN_name(mem.getN_name())	;
		System.out.println("loginMember="+loginMember);
		jpaMember.save(loginMember);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.jsp");
		return mav;
	}
}