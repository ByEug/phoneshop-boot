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

    public int getPlpMaxPages() {
        return plpMaxPages;
    }

    public void setPlpMaxPages(int plpMaxPages) {
        this.plpMaxPages = plpMaxPages;
    }
}
