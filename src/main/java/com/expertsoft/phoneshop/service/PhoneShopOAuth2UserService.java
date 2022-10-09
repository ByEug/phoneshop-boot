package com.expertsoft.phoneshop.service;

import com.expertsoft.phoneshop.persistence.model.GitHubOAuth2User;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PhoneShopOAuth2UserService extends DefaultOAuth2UserService {

    @Resource
    private PhoneShopUserService phoneShopUserService;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        GitHubOAuth2User gitHubOAuth2User = new GitHubOAuth2User(oAuth2User);
        phoneShopUserService.updateUser(gitHubOAuth2User);
        return gitHubOAuth2User;
    }
}
