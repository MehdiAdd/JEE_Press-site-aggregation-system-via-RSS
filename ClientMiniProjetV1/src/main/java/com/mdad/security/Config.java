package com.mdad.security;






import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.stereotype.Controller;
@Controller
@EnableWebSecurity
public class Config extends WebSecurityConfigurerAdapter {
	@Autowired
	private DataSource datasource;
	@SuppressWarnings("deprecation")
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(datasource).passwordEncoder(NoOpPasswordEncoder.getInstance()).authoritiesByUsernameQuery("select username, password, enabled from users where username=?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		
	//	http.formLogin().loginPage("/login").permitAll();
		//.and().logout().permitAll();
		http.authorizeRequests()
		   .antMatchers("/images/**",
		                "/assets/**","/js/**","/css/**","/registerPage","/register","/register.jsp","/registr","/registerAction").permitAll()
		.anyRequest().authenticated()
	.and()
	.formLogin()
		.loginPage("/loginPage")
		.usernameParameter("username").passwordParameter("password")
		.defaultSuccessUrl("/",false)
		.loginProcessingUrl("/perform_login")
		.permitAll()
		.and().csrf().disable();
		
		
	

		
	
	}
}
