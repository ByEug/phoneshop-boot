package com.expertsoft.phoneshop.controller.page;

import com.expertsoft.phoneshop.facade.PhoneFacade;
import com.expertsoft.phoneshop.persistence.form.PlpSearchForm;
import com.expertsoft.phoneshop.properties.PhoneShopProperties;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.validation.Valid;

import static com.expertsoft.phoneshop.PhoneShopConstants.PHONES_PATH;

@Controller
@RequestMapping(PHONES_PATH)
public class PhoneListPageController {

    private static final String PHONE_LIST_PAGE = "phoneListPage";
    private static final String PHONES = "phones";
    private static final String SEARCH_ERROR = "searchError";
    private static final String SEARCH_ERROR_PROPERTY_NAME = "plp.search.error.message";
    private static final String PLP_MAX_PAGES = "plpMaxPages";
    private static final String PLP_SEARCH_FORM = "plpSearchForm";

    @Resource
    private PhoneFacade phoneFacade;
    @Resource
    private PhoneShopProperties phoneShopProperties;

    @GetMapping
    public String getPhoneList(Pageable pageable, Model model) {
        model.addAttribute(PHONES, phoneFacade.getPhonesPage(pageable));
        model.addAttribute(PLP_SEARCH_FORM, new PlpSearchForm());

        return PHONE_LIST_PAGE;
    }

    @GetMapping("/search")
    public String searchPhones(Pageable pageable, @Valid @ModelAttribute PlpSearchForm plpSearchForm,
                               BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return emptyResultWithSearchError(plpSearchForm, model);
        }
        model.addAttribute(PLP_SEARCH_FORM, plpSearchForm);
        model.addAttribute(PHONES, phoneFacade.searchByQueryAndPriceRange(plpSearchForm, pageable));

        return PHONE_LIST_PAGE;
    }

    @ModelAttribute
    public void addPlpMaxPagesAttribute(Model model) {
        model.addAttribute(PLP_MAX_PAGES, phoneShopProperties.getPlpMaxPages());
    }

    private String emptyResultWithSearchError(PlpSearchForm plpSearchForm, Model model) {
        model.addAttribute(PLP_SEARCH_FORM, plpSearchForm);
        model.addAttribute(SEARCH_ERROR, SEARCH_ERROR_PROPERTY_NAME);

        return PHONE_LIST_PAGE;
    }
}
