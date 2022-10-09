package com.expertsoft.phoneshop.facade;

import com.expertsoft.phoneshop.persistence.model.PhoneShopUser;
import com.expertsoft.phoneshop.service.PhoneShopUserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class UserFacade {

    @Resource
    private PhoneShopUserService phoneShopUserService;

    public Page<PhoneShopUser> getUsersPage(Pageable pageable) {
        return phoneShopUserService.getUsersPage(pageable);
    }
}
