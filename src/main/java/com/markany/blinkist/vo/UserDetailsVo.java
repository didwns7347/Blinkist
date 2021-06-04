package com.markany.blinkist.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
/* Spring Security 로그인을 위한 UserDetails Vo 객체*/
public class UserDetailsVo implements UserDetails {
	
	//안만들어도 상관없지만 Warning이 발생함
	private static final long serialVersionUID=1L;
	
	@Override
	public String toString() {
		return "UserDetailsVo [email=" + email + ", password=" + password + ", authorities=" + authorities
				+ ", enabled=" + enabled + "]";
	}

	private String email;
	private String password;
	private List<GrantedAuthority> authorities;
	private int enabled=1;
	//setter
	public String getEmail() {
		return email;
	}
	
	//setter
	public void setEmail(String email) {
		this.email = email;
	}
	
	//setter
	public void setPassword(String password) {
		this.password = password;
	}
	
	//setter
	public void setAuthorities(List<String> authList) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(int i=0; i<authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}
		
		this.authorities=authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	//PW
	public String getPassword() {
		return this.password;
	}

	@Override
	//ID
	public String getUsername() {
		return this.email;
	}

	@Override
	//계정이 만료되지 않았는가?
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	//계정이 잠기지 않았는가?
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	//패스워드가 만료되지 않았는가?
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	//계정이 활성화 되었는가??
	public boolean isEnabled() {
		return true;
	}

	public int getEnabled() {
		return enabled;
	}

}
