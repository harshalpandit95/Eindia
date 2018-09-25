package com.eindia.securedDocumentsApp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.eindia.repo.InfoRepo;

/*@EnableJpaRepositories(basePackages = "com.eindia.repo")
@EntityScan("com.eindia.domain")*/
@ComponentScan("com.eindia")
@SpringBootApplication
public class SecuredDocumentsApplication implements CommandLineRunner {
	@Autowired
	private InfoRepo trepo;

	public static void main(String[] args) {
		SpringApplication.run(SecuredDocumentsApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println(trepo.getUserDetails("EIN16809807", "user1", "user").toString());

	}
}
