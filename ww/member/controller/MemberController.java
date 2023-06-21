package ww.member.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.*;

import jakarta.servlet.http.*;
import jakarta.persistence.*;
import ww.member.model.*;
import ww.member.vo.*;

@Controller
public class MemberController {
	@Autowired // JpaMemberRepository인터페이스를 상속 받아서
	// SQL쿼리를 실행하는 메서드가 구현된 클래스 객체를 대입 받음
	// 해당 객체는 다형성으로 부모 타입의 인터페이스 변수에 저장
	JpaMemberRepository jpaMember;
	
	// 로그인 처리 메서드
	// value="loginControl": url insertMemberControl
	// method=RequestMethod.POST: POST방식 요청에만 실행
	@RequestMapping(value="loginControl", method=RequestMethod.POST)
	public ModelAndView login(Member mem, HttpSession session) {
		// 입력한 비밀번호를 리턴해서 inputId에 저장
		String inputId = mem.getId();
		
		boolean pwMatch = false;
		Member dbMember = null;
		// 데이터베이스 업무를 처리할 모델 생성
		// MemberDAO dao = new MemberDAO();
		// 아이디가 일치하는 회원 정보를 조회해서 리턴
		// Member dbMember = dao.selectMember(inputId);
		// 데이터베이스에 저장된 비밀번호를 리턴해서 dbpw에 저장(암호화된 비밀번호)
		try {
		dbMember = jpaMember.getById(inputId);
		String dbpw = dbMember.getPw();
		// 회원이 입력한 비번을 리턴해서 inputpw 에 저장
		String inputpw = mem.getPw();
		// 입력한 비번을 암호화하고 암호화된 데이터와 입력 데이터가 일치하는지 비교하는 객체
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// encoder.matches(inputpw, dbpw):
		//					inputpw(입력한 비번) dbpw(암호화된 비번)
		//			일치하는지 비교 일치하면 true 일치하지 않으면 false
		// boolean pwMatch = encoder.matches(inputpw, dbpw);
		pwMatch=encoder.matches(inputpw, dbpw);
		
		}catch(EntityNotFoundException e) {
			e.printStackTrace();
		}
		// JSP로 전송할 정보와 JSP를 저장할 객체
		ModelAndView mav = new ModelAndView();
		
		// pwMatch가 true일때 (inputpw(입력한 비번) dbpw(암호화된 비번) 일치)
		if(pwMatch==true) {
			// 로그인한 회원 정보(dbMember) session에 저장(session에 저장된 정보는 일정 시간동안 유지됨)
			session.setAttribute("login_member", dbMember);
			// main.jsp로 이동
			mav.setViewName("main.jsp");
		}else { // pwMatch가 true일때 (inputpw(입력한 비번) dbpw(암호화된 비번) 일치하지 않을때)
			// JSP로 전송할 메시지 설정
			mav.addObject("result", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			// 로그인 페이지로 이동
			mav.setViewName("login.jsp");
		}
		return mav;
	}
	
	// 로그인 페이지로 이동할 메서드
	// value="loginControl": url insertMemberControl
	// method=RequestMethod.GET: GET방식 요청에만 실행
	@RequestMapping(value="loginControl", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 페이지로 이동하도록 설정
		mav.setViewName("login.jsp");
		return mav;
	}
	// 회원가입 처리 메서드
	// value="insertMemberControl": url insertMemberControl
	// method=RequestMethod.POST: POST방식 요청에만 실행
	@RequestMapping(value = "insertMemberControl", method = RequestMethod.POST)
	public ModelAndView insertMember(Member mem) {
		// 사용자 입력한 비번 리턴해서 input_pw에 저장
		String input_pw = mem.getPw();
		// 입력한 비번을 암호화 할 객체
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 사용자 입력 비번을 (input_pw) 암호화해서 리턴 encode_pw에 저장
		String encode_pw = encoder.encode(input_pw);
		// 입력한 비번을 암호화한 비번으로 덮기!
		mem.setPw(encode_pw);
		
		// 데이터베이스와 연동하고 업무를 처리할 모델 객체 생성
//		MemberDAO dao = new MemberDAO();
		// 회원 정보를 데이터베이스에 저장하는 메서드 호출
//		dao.insertMember(mem);
		
		jpaMember.save(mem);

		ModelAndView mav = new ModelAndView();
		// index.jsp로 이동하도록 설정
		mav.setViewName("login.jsp");

		return mav;
	}

	// 회원 가입 페이지로 이동할 메서드
	// value="insertMemberControl": url insertMemberControl
	// method=RequestMethod.GET: GET방식 요청에만 실행
	@RequestMapping(value = "insertMemberControl", method = RequestMethod.GET)
	public ModelAndView insertMemberForm() {
		ModelAndView mav = new ModelAndView();
		// 회원 가입 페이지로 이동하도록 설정
		mav.setViewName("insertMember.jsp");
		return mav;
	}
	
	//로그아웃 메서드
	@RequestMapping(value="logoutControl")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("login_member");
		mav.setViewName("login.jsp");
		return mav;
	}
	
}
