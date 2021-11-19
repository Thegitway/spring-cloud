package com.example.springcould;

import com.example.springcould.entities.Customer;
import com.example.springcould.repositories.CustomerRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringCouldApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCouldApplication.class, args);
    }

    @Bean
    CommandLineRunner start(CustomerRepository customerRepository){
        return args ->{
            customerRepository.save(new Customer(null,"mouad","med@gmail.com"));
            customerRepository.save(new Customer(null,"omar","omar@gmail.com"));
            customerRepository.save(new Customer(null,"toto","toto@gmail.com"));
            customerRepository.findAll().forEach(customer -> System.out.println(customer.getName()));
        };
    }

}
