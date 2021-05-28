package com.tmh.t1.member;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.tmh.t1.brand.BrandVO;

import lombok.Data;

@Data
public class MemberVO implements UserDetails{
//====회원가입====
	@NotEmpty
	@Email
	private String email;
	@NotEmpty
	@Length(max=15, min=2)
	private String username;
	@NotEmpty
	@Length(max=15, min=4)
	private String password;
	@NotEmpty
	private String passwordCheck;
	private boolean enabled;
	
	private String homePage;
	private String gender;
	private String intro;
	private String profileImage;
	
	private List<RoleVO> roles;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for(RoleVO roleVO: this.roles) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
		}

		return authorities;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}
	
}
