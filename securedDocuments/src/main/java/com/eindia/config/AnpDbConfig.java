package com.eindia.config;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(entityManagerFactoryRef = "eindiaEntityManagerFactory", transactionManagerRef = "eindiaTransactionManager", basePackages = {
		"com.eindia.repo" })
public class AnpDbConfig {

	@Bean(name = "eindiaDataSource")
	@ConfigurationProperties(prefix = "eindia.datasource")
	public DataSource dataSource() {
		return org.springframework.boot.jdbc.DataSourceBuilder.create().build();
	}

	@Bean(name = "eindiaEntityManagerFactory")
	public LocalContainerEntityManagerFactoryBean anpEntityManagerFactory(EntityManagerFactoryBuilder builder,
			@Qualifier("eindiaDataSource") DataSource dataSource) {
		return builder.dataSource(dataSource).packages("com.eindia.domain").persistenceUnit("eindia").build();
	}

	@Bean(name = "eindiaTransactionManager")
	public PlatformTransactionManager anpTransactionManager(
			@Qualifier("eindiaEntityManagerFactory") EntityManagerFactory anpEntityManagerFactory) {
		return new JpaTransactionManager(anpEntityManagerFactory);
	}
}
