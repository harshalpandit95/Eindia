package com.eindia.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eindia.domain.User;

@Repository	
public interface UserRepo extends CrudRepository<User, Long>{

}
