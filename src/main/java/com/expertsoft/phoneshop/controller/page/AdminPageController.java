package com.expertsoft.phoneshop.controller.page;

import com.expertsoft.phoneshop.facade.UserFacade;
import com.expertsoft.phoneshop.properties.PhoneShopProperties;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

import static com.expertsoft.phoneshop.PhoneShopConstants.ADMIN_PATH;

@Controller
@RequestMapping(ADMIN_PATH)
public class AdminPageController {

    private static final String ADMIN_PANEL_PAGE = "admin/adminPanelPage";
    private static final String USERS = "users";
    private static final String PLP_MAX_PAGES = "plpMaxPages";

    @Resource
    private UserFacade userFacade;
    @Resource
    private PhoneShopProperties phoneShopProperties;

    @GetMapping
    public String getUsersList(Pageable pageable, Model model) {
        model.addAttribute(USERS, userFacade.getUsersPage(pageable));
        model.addAttribute(PLP_MAX_PAGES, phoneShopProperties.getPlpMaxPages());

        return ADMIN_PANEL_PAGE;
    }
}
