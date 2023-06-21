package ww.member.model;

import java.sql.*;
import ww.member.vo.Member;

public class MemberDAO {
	// 회원 1명 정보를 조회해서 리턴
	// 매개변수 id: 조회하고자 하는 회원 아이디
	public Member selectMember(String id) {
		// 회원 1명 정보가 저장될 변수
		Member mem = new Member();
		try {
			// jdbc 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// DB접속
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ww_project", "root","manager");
			// 회원 1명 조회 SQL쿼리
			String sql="SELECT * FROM userdb WHERE id=?";
			// sql변수에 저장된 쿼리를 실행할 PreparedStatment 객체 생성
			PreparedStatement stmt = conn.prepareStatement(sql);
			// ?에 값 대입
			stmt.setString(1, id);
			// select 쿼리 실행
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				// 조회결과에서 id 컬럼값을 리턴해서 c1에 저장
				String c1=rs.getString("id");
				// id컬럼값이 저장된 c1을 Member객체의 id 속성에 저장
				mem.setId(c1);
				// 조회결과에서 pw 컬럼값을 리턴해서 c2에 저장
				String c2=rs.getString("pw");
				// pw 컬럼값이 저장된 c2을 Member객체의 pw 속성에 저장
				mem.setPw(c2);
				// 조회결과에서 email 컬럼값을 리턴해서 c3에 저장
				String c3=rs.getString("email");
				// email 컬럼값이 저장된 c3을 Member객체의 eamil 속성에 저장
				mem.setEmail(c3);
				// 조회결과에서 name 컬럼값을 리턴해서 c4에 저장
				String c4=rs.getString("n_name");
				// name 컬럼값이 저장된 c4을 Member객체의 name 속성에 저장
				mem.setN_name(c4);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mem;
	}
	
	// 회원추가
	// 매개변수 mem: 추가하고자 하는 회원 정보
	public void insertMember(Member mem) {
		try {
			// 데이터베이스에 데이터를 저장할 SQL 쿼리
			String sql = "INSERT INTO userdb (id,pw,email,n_name) VALUES (?,?,?,?)";
			// jdbc 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 데이터베이스에 접속
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ww_project", "root", "manager");
			// sql쿼리를 실행항 PreparedStatement 객체 생성
			PreparedStatement stmt = conn.prepareStatement(sql);
			// mem.getId(): id 속성값 리턴
			stmt.setNString(1, mem.getId());
			// mem.getPw(): pw 속성값 리턴
			stmt.setNString(2, mem.getPw());
			// mem.getEmail(): eamil 속성값 리턴
			stmt.setNString(3, mem.getEmail());
			// mem.getName(): name 속성값 리턴
			stmt.setNString(4, mem.getN_name());
			// insert 쿼리를 실행
			stmt.executeUpdate();
			// 객체 종료
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int duplecateId(String id) {
		int cnt=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// DB접속
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ww_project", "root","manager");
			// 회원 1명 조회 SQL쿼리
			String sql="SELECT count(id) as cnt FROM userdb WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복 확인 실패 : "+e);;
		}
		return cnt;

	}
	
	public int duplecateNickname(String n_name) {
		int cnt=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// DB접속
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ww_project", "root","manager");
			// 회원 1명 조회 SQL쿼리
			String sql="SELECT count(id) as cnt FROM userdb WHERE n_name=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, n_name);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("닉네임 중복 확인 실패 : "+e);;
		}
		return cnt;
	}
	
}