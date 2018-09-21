package com.eindia.securedDocumentsApp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.ClassPathResource;

import com.eindia.domain.Test;
import com.eindia.repo.TestRepo;

/*@EnableJpaRepositories(basePackages = "com.eindia.repo")
@EntityScan("com.eindia.domain")*/
@ComponentScan("com.eindia")
@SpringBootApplication
public class SecuredDocumentsApplication implements CommandLineRunner {
	@Autowired
	private TestRepo trepo;

	public static void main(String[] args) {
		SpringApplication.run(SecuredDocumentsApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
	
	/*	System.out.println(trepo.count());*/

	}
}
