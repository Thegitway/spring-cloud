package com.example.billingservice;

import com.example.billingservice.entities.Bill;
import com.example.billingservice.entities.Customer;
import com.example.billingservice.repositories.BillRepository;
import com.example.billingservice.repositories.CustomerServiceClient;
import com.example.billingservice.repositories.InventoryServiceClient;
import com.example.billingservice.repositories.ProductItemRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

import java.util.Collection;
import java.util.Date;

@SpringBootApplication
@EnableFeignClients
public class BillingServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(BillingServiceApplication.class, args);
    }
    @Bean
    CommandLineRunner start(BillRepository billRepository,
                            ProductItemRepository productItemRepository,
                            CustomerServiceClient customerServiceClient,
                            InventoryServiceClient inventoryServiceClient){
        return args -> {

            Bill bill=new Bill(null,new Date(),null,1,new Customer());
            billRepository.save(bill);
            Customer customer=customerServiceClient.findCustomerById(1L);
            System.out.println("--------------");
            System.out.println(customer.getId());
            System.out.println(customer.getName());
            System.out.println(customer.getEmail());

        };

    }

}
