package com.markany.blinkist.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import com.markany.blinkist.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserService userDetailServiceCustom;
	
	private AccessDeniedHandler adh = new CustomAccessDeniedHandler();
	
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		http
           .authorizeRequests()          	
               .antMatchers("/**","/loginprocess","/user/injoin","/user/forgetUpdate","/user/joincheck",
            		   "/user/forget","/email/mailcheck","/user/kakaoLogin", "/user/callback/**","/user/join", "/css/**", "/js/**", "/assets/**", "/lib/**").permitAll()
               .antMatchers("/library/**", "/hilight/**", "/content/**", "/book/**").hasAnyAuthority("monthP","yearP")
               .anyRequest().authenticated()
               .and()
           .exceptionHandling()
           		.accessDeniedHandler(adh)
           		.and()
           .formLogin()
               .loginPage("/user/login")
               .loginProcessingUrl("/loginprocess")
               .usernameParameter("email")
               .permitAll()
               .and()
           .logout()
           		.logoutSuccessUrl("/")
           		.permitAll();

     }

	
	//시큐리티 로그인 커스텀
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(userDetailServiceCustom).passwordEncoder(passwordEncoder());
		
	}

	//비밀번호 암호화 로직 
	@Bean
	public PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
		
	}
}