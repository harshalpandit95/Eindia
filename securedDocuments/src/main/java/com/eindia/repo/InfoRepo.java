package com.eindia.repo;

import javax.persistence.Column;
import javax.persistence.Id;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.eindia.domain.Info;

public interface InfoRepo extends CrudRepository<Info, Long> {

	@Query("select t from Info t where t.uname=:uname and t.password=:password and t.loginType=:lType")
	Info getUserDetails(@Param("uname") String uname, @Param("password") String password, @Param("lType") String lType);

	@Query("select t from Info t where t.uname=:uname  and t.email=:email")
	Info getPassword(@Param("uname") String uname, @Param("email") String email);

<<<<<<< HEAD
	@Transactional
	@Modifying
	@Query("update Info t set t.password=:newpassword where t.uname=:uname and t.password=:password and t.loginType=:lType")
	void updatePassword(@Param("uname") String uname, @Param("password") String password, @Param("lType") String lType,
			@Param("newpassword") String newpassword);

=======
>>>>>>> 7058d594bf76d0545a962eb0e865ee3ea83fc404
}
