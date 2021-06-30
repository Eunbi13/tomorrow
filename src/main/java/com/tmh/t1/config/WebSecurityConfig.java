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
				.antMatchers("/product/insert").hasRole("B")
				.antMatchers("/product/update").hasRole("B")
				.antMatchers("/product/**").permitAll()
				.antMatchers("/options/update").hasRole("B")
				.antMatchers("/housewarming/**").permitAll()
				//.anyRequest().authenticated()//현재 유저가 누구인지 확인
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
