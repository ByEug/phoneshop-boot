package com.expertsoft.phoneshop;

public class PhoneShopConstants {

    public static final String ROOT_PATH = "/";
    public static final String PHONES_PATH = "/phones";
    public static final String ADMIN_PATH = "/admin";
    public static final String LOGIN_PATH = "/login";
    public static final String LOGIN_ERROR_PATH = "/login?error=true";
    public static final String LOGOUT_PATH = "/logout";
    public static final String PHONES_OTHER_PATH = "/phones/**";
    public static final String PHONES_SEARCH_PATH = "/phones/search";

    private PhoneShopConstants() {
        // instance not allowed
    }
}
