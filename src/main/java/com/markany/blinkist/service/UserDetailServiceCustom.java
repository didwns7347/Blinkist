package com.markany.blinkist.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.markany.blinkist.dao.UserRepository;
import com.markany.blinkist.vo.UserDetailsVo;
import com.markany.blinkist.vo.UserVo;


@Service
public class UserDetailServiceCustom implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;
	
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		//최종적으로 리턴해야할 객체
		UserDetailsVo userDetails = new UserDetailsVo();
		
		//사용자 정보 select
		UserVo vo = userRepository.findByEmail(email);
		
		//사용자 정보가 없으면 null처리
		if(vo==null) {
			return null;
		}
		userDetails.setEmail(vo.getEmail());
		userDetails.setPassword(vo.getPassword());
		List<String> authorities=new ArrayList<String>();
		authorities.add(vo.getGrade().toString());
		return userDetails;
		
	}

}
