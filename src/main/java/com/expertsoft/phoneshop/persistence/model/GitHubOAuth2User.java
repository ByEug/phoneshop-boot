package com.expertsoft.phoneshop.persistence.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class GitHubOAuth2User implements OAuth2User {

    private String login;
    private String fullName;
    private String bio;
    private String avatarUrl;
    private String location;
    private String company;
    private Map<String, Object> attributes;

    public GitHubOAuth2User(OAuth2User oAuth2User) {
        login = oAuth2User.getAttribute("login");
        fullName = oAuth2User.getAttribute("name");
        bio = oAuth2User.getAttribute("bio");
        avatarUrl = oAuth2User.getAttribute("avatar_url");
        location = oAuth2User.getAttribute("location");
        company = oAuth2User.getAttribute("company");
    }

    @Override
    public Map<String, Object> getAttributes() {
        if (attributes == null) {
            attributes = new HashMap<>();
            attributes.put("login", login);
            attributes.put("fullName", fullName);
            attributes.put("bio", bio);
            attributes.put("avatarUrl", avatarUrl);
            attributes.put("location", location);
            attributes.put("company", company);
        }
        return attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getName() {
        return login;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }
}
