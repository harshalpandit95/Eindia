package com.eindia.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.eindia.domain.Info;

public interface InfoRepo extends CrudRepository<Info, Long> {

	@Query("select t from Info t where t.uname=:uname and t.password=:password and t.loginType=:lType")
	Info getUserDetails(@Param("uname") String uname, @Param("password") String password, @Param("lType") String lType);

	@Query("select t from Info t where t.uname=:uname  and t.email=:email")
	Info getPassword(@Param("uname") String uname, @Param("email") String email);

}
