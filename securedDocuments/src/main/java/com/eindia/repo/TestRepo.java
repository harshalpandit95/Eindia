package com.eindia.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eindia.domain.Test;
@Repository
public interface TestRepo extends CrudRepository<Test, Long>{

}
