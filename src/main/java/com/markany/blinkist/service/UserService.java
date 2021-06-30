package com.markany.blinkist.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.markany.blinkist.vo.UserDetailsVo;
import com.markany.blinkist.vo.UserVo;
import com.markany.blinkist.dao.*;


@Service
public class UserService implements UserDetailsService {

	@Autowired
	private UserRepository userDAO;

	// 이메일 중복확인
	public UserVo findByEmail(String email) {
		
		UserVo vo = new UserVo();
		vo.setEmail(email);
		
		return userDAO.findByEmail(email);

	}

	
	// 회원가입
	public boolean insert(UserVo uservo) {
		
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		uservo.setPassword(passwordEncoder.encode(uservo.getPassword()));
		
		return userDAO.insert(uservo);

	}

	
	// 회원정보가져오기
	public UserVo selectbyUser(String email) {
		
		return userDAO.selectbyUser(email);

	}

	
	// 비밀번호변경
	public boolean updatePw(String email, String oldpassword, String newpassoword) {
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		UserVo userVo=this.findByEmail(email);
		if(passwordEncoder.matches(oldpassword, userVo.getPassword())) {
			
			userDAO.updatePw(userVo.getUser_no(), passwordEncoder.encode(newpassoword));
			return true;
			
		}
		
		return false;
		
	}

	
	// 회원탈퇴
	public boolean deleteUser(String email) {
		
		return userDAO.deleteUser(email);
		
	}

	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		// 최종적으로 리턴해야할 객체
		UserDetailsVo userDetails = new UserDetailsVo();

		// 사용자 정보 select
		UserVo vo = userDAO.findByEmail(email);

		// 사용자 정보가 없으면 null처리
		if (vo == null) {
		
			return null;
		}

		//시큐리티 로그인 로직 수행
		userDetails.setEmail(vo.getEmail());
		userDetails.setPassword(vo.getPassword());
		List<String> authorities = new ArrayList<String>();
		authorities.add(vo.getGrade().toString());
		userDetails.setAuthorities(authorities);
		
		return userDetails;

	}

	
	// 회원등급변경
	public boolean updategrade(UserVo uservo) {

		return userDAO.updategrade(uservo);

	}

	
	// primium날짜가 지났다면 회원의 등급과 premium_date날짜를 바꿔준다.
	public boolean PassPrimium(UserVo uservo) {

		return userDAO.PassPrimium(uservo);

	}


	

	//비밀번호 잊어버린 사람들 이메일 인증후 비밀 번호 변경
	public boolean updatePwForget(UserVo userVo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		userVo.setPassword(passwordEncoder.encode(userVo.getPassword()));
		return userDAO.updatePwForget(userVo);
	}
}