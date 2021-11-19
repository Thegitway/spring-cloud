package com.example.inventoryservice;

import com.example.inventoryservice.entitites.Product;
import com.example.inventoryservice.repositories.ProductRepostirory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class InventoryServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(InventoryServiceApplication.class, args);
    }
    @Bean
    CommandLineRunner start(ProductRepostirory productRepostirory){
    return args -> {
        productRepostirory.save(new Product(null,"Ordinateur",7606,43));
        productRepostirory.save(new Product(null,"Phone",3500,120));
        productRepostirory.save(new Product(null,"car",240000,3));
        productRepostirory.findAll().forEach(product -> System.out.println(product.getName()));
    };
    }

}


