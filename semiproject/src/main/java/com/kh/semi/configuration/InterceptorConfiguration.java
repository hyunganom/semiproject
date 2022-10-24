package com.kh.semi.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.semi.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{

	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//인터셉터 작동하도록 설정
		registry.addInterceptor(memberInterceptor)
		.addPathPatterns(
				"/member/**"//회원전체
				)
		.excludePathPatterns(
				"/member/join",//회원가입
				"/member/login"//로그인
				);
	}
}
