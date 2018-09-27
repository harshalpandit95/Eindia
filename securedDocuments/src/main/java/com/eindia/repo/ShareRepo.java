package com.eindia.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.eindia.domain.Share;

public interface ShareRepo extends CrudRepository<Share, Long> {

	/*
	 * @Query("select t from Info t where t.uname=:uname and t.password=:password and t.loginType=:lType"
	 * ) Info getUserDetails(@Param("uname") String uname, @Param("password") String
	 * password, @Param("lType") String lType);
	 * 
	 * @Query("select t from Info t where t.uname=:uname  and t.email=:email") Info
	 * getPassword(@Param("uname") String uname, @Param("email") String email);
	 * 
	 * 
	 * @Transactional
	 * 
	 * @Modifying
	 * 
	 * @Query("update Info t set t.password=:newpassword where t.uname=:uname and t.password=:password and t.loginType=:lType"
	 * ) void updatePassword(@Param("uname") String uname, @Param("password") String
	 * password, @Param("lType") String lType,
	 * 
	 * @Param("newpassword") String newpassword);
	 */

	@Query("select t from Share t where t.user=:user and t.tp=:tp order by user desc ")
	Share getUserDetails(@Param("user") String user, @Param("tp") String tp);

}
