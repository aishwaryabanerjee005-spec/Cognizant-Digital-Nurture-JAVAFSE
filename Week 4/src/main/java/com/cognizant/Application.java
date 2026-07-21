package com.cognizant;

import com.cognizant.model.Country;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource("classpath:spring.xml")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner run(ApplicationContext context) {
        return args -> {
            Country country = context.getBean("country", Country.class);
            System.out.println("Loaded Country: " + country.getName());
        };
    }
}
