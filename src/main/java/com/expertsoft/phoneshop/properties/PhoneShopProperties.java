package com.expertsoft.phoneshop.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Positive;

@Validated
@Component
@ConfigurationProperties(prefix="phoneshop")
public class PhoneShopProperties {

    @Positive
    private int plpMaxPages;
    @Positive
    private int phonesPageQuantity;

    public int getPlpMaxPages() {
        return plpMaxPages;
    }

    public void setPlpMaxPages(int plpMaxPages) {
        this.plpMaxPages = plpMaxPages;
    }

    public int getPhonesPageQuantity() {
        return phonesPageQuantity;
    }

    public void setPhonesPageQuantity(int phonesPageQuantity) {
        this.phonesPageQuantity = phonesPageQuantity;
    }
}
