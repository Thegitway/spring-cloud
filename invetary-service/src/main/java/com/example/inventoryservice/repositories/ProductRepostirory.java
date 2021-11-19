package com.example.inventoryservice.repositories;

import com.example.inventoryservice.entitites.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepostirory extends JpaRepository<Product,Long> {
}
