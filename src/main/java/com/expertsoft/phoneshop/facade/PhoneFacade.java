package com.expertsoft.phoneshop.facade;

import com.expertsoft.phoneshop.persistence.form.PlpSearchForm;
import com.expertsoft.phoneshop.persistence.model.Phone;
import com.expertsoft.phoneshop.service.PhoneService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Optional;

@Component
public class PhoneFacade {

    @Resource
    private PhoneService phoneService;

    public Phone getPhoneById(Long id) {
        return phoneService.getPhoneById(id);
    }

    public Page<Phone> getPhonesPage(Pageable pageable) {
        return phoneService.getPhonesPage(pageable);
    }

    public Page<Phone> searchByQueryAndPriceRange(PlpSearchForm plpSearchForm, Pageable pageable) {
        String searchQuery = Optional.ofNullable(plpSearchForm.getSearchQuery()).orElse("");
        BigDecimal priceFrom = Optional.ofNullable(plpSearchForm.getPriceFrom()).orElse(BigDecimal.ZERO);
        BigDecimal priceTo = Optional.ofNullable(plpSearchForm.getPriceTo())
                .orElse(BigDecimal.valueOf(Integer.MAX_VALUE));
        return phoneService.searchByQueryAndPriceRange(searchQuery, priceFrom, priceTo, pageable);
    }
}
