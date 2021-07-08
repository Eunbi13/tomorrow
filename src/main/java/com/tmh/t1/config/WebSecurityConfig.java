package com.tmh.t1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.tmh.t1.security.LoginFailed;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/resources/**")
		.antMatchers("/images/**")
		.antMatchers("/css/**")
		.antMatchers("/js/**")
		.antMatchers("/vendor/**")
		.antMatchers("/favicon/**")
		;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.cors().and()
			.csrf().disable()
			.authorizeRequests()
				.antMatchers("/").permitAll()
				.antMatchers("/member/memberJoin").permitAll()
				.antMatchers("/member/**").hasRole("U")
				.antMatchers("/brand/mList").hasRole("M")//브랜드 리스트
				.antMatchers("/brand/select").hasRole("M")//브랜드 수락 상세페이지
				.antMatchers("/brand/accept").hasRole("M")//브랜드 수락 페이지
				.antMatchers("/brand/signBrand").hasRole("U")//브랜드 입점 페이지
				.antMatchers("/brand/**").permitAll()
				.antMatchers("/product/insert").hasRole("B")//상품 등록 페이지
				.antMatchers("/product/update").hasRole("B")//상품 수정 페이지
				.antMatchers("/product/**").permitAll()
				.antMatchers("/housewarming/insert").hasRole("U")//집들이 등록 페이지
				.antMatchers("/housewarming/**").permitAll()
				.antMatchers("/orders/list").hasRole("U")//주문조회 페이지
				.anyRequest().authenticated()//현재 유저가 누구인지 확인
				.and()
			.exceptionHandling()
				.accessDeniedPage("/403")//권한이 없는 사람이 접근했을 때 해당 url로 이동(HomeController)
				.and()
			.formLogin()
				.usernameParameter("email")
				.loginPage("/member/login")
				.defaultSuccessUrl("/member/memberLoginResult")
				.failureHandler(new LoginFailed())
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/member/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()
			;
	}
	
}
