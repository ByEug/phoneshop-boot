package com.expertsoft.phoneshop.service;

import com.expertsoft.phoneshop.persistence.model.Phone;
import com.expertsoft.phoneshop.persistence.repository.PhoneRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.EntityNotFoundException;
import java.math.BigDecimal;

@Service
public class PhoneService {

    @Resource
    private PhoneRepository phoneRepository;

    public Page<Phone> getPhonesPage(Pageable pageable) {
        return phoneRepository.findAll(pageable);
    }

    public Phone getPhoneById(Long id) {
        return phoneRepository.findById(id).orElseThrow(EntityNotFoundException::new);
    }

    public Page<Phone> searchByQueryAndPriceRange(String searchQuery, BigDecimal priceFrom,
                                                  BigDecimal priceTo, Pageable pageable) {
        return phoneRepository.searchByQueryAndPriceRange(searchQuery, priceFrom, priceTo, pageable);
    }
}
