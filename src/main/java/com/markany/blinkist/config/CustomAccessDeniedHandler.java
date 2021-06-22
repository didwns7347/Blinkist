package com.markany.blinkist.config;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		//현재 사용자 정보를 전역으로 선언된 SecurityContextHolder에서 가져올 수 있음
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		boolean basicCheck=false;
		boolean PrimiumCheck=false;
		
		
		//사용자가 로그인 안된경우
		if(auth!=null) {
			
			System.out.println("User: " + auth.getName() + " attempted to access the protected URL: " + request.getRequestURI());
			
		}
		
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = authorities.iterator();
		
		
		while(iter.hasNext()) {
			
			GrantedAuthority gAuth = iter.next();
			
			if(("basic").equals(gAuth.getAuthority())){
				
				basicCheck=true;
				
			}
			
			if(("monthP").equals(gAuth.getAuthority()) ||("yearP").equals(gAuth.getAuthority()) ){
				
				PrimiumCheck=true;
				
			}
		}
		
		
		if(basicCheck){
			
			response.sendRedirect(request.getContextPath()+"/user/upgradepremium");
			
		}else if(PrimiumCheck){
			response.sendRedirect(request.getContextPath()+"/error/primiumerror");
			
		}else {
			
			response.sendRedirect(request.getContextPath()+"/error/fail");
			
		}
	}
}