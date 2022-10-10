package com.expertsoft.phoneshop.persistence.repository;

import com.expertsoft.phoneshop.persistence.model.Phone;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;

public interface PhoneRepository extends JpaRepository<Phone, Long> {

    @Query("SELECT p FROM Phone p WHERE (LOWER(p.brand) LIKE LOWER(CONCAT('%', ?1, '%')) " +
            "OR LOWER(p.model) LIKE LOWER(CONCAT('%', ?1, '%')))" +
            "AND p.price >= ?2 AND p.price <= ?3")
    Page<Phone> searchByQueryAndPriceRange(String searchQuery, BigDecimal priceFrom,
                                           BigDecimal priceTo, Pageable pageable);
}
