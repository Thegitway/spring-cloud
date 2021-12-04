package com.example.inventoryservice.repositories;

import com.example.inventoryservice.entitites.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@RepositoryRestResource
@CrossOrigin(origins = "*")
public interface ProductRepostirory extends JpaRepository<Product,Long> {
}
