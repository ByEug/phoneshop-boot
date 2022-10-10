package com.expertsoft.phoneshop.persistence.form;

import javax.validation.constraints.DecimalMin;
import java.math.BigDecimal;

public class PlpSearchForm {

    private String searchQuery;

    @DecimalMin("0")
    private BigDecimal priceFrom;

    @DecimalMin("0")
    private BigDecimal priceTo;

    public String getSearchQuery() {
        return searchQuery;
    }

    public void setSearchQuery(String searchQuery) {
        this.searchQuery = searchQuery;
    }

    public BigDecimal getPriceFrom() {
        return priceFrom;
    }

    public void setPriceFrom(BigDecimal priceFrom) {
        this.priceFrom = priceFrom;
    }

    public BigDecimal getPriceTo() {
        return priceTo;
    }

    public void setPriceTo(BigDecimal priceTo) {
        this.priceTo = priceTo;
    }
}
