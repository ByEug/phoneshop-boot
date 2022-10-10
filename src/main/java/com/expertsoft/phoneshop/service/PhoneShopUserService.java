package com.expertsoft.phoneshop.service;

import com.expertsoft.phoneshop.persistence.model.GitHubOAuth2User;
import com.expertsoft.phoneshop.persistence.model.PhoneShopUser;
import com.expertsoft.phoneshop.persistence.model.Role;
import com.expertsoft.phoneshop.persistence.repository.PhoneShopUserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.EntityNotFoundException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class PhoneShopUserService implements UserDetailsService {

    private static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    @Resource
    private PhoneShopUserRepository phoneShopUserRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return phoneShopUserRepository.findByUsername(username).orElseThrow(EntityNotFoundException::new);
    }

    public Page<PhoneShopUser> getUsersPage(Pageable pageable) {
        return phoneShopUserRepository.findAll(pageable);
    }

    public void updateUser(GitHubOAuth2User gitHubOAuth2User) {
        PhoneShopUser phoneShopUser = phoneShopUserRepository
                .findByUsername(gitHubOAuth2User.getLogin()).orElseGet(PhoneShopUser::new);
        phoneShopUser.setUsername(gitHubOAuth2User.getLogin());
        phoneShopUser.setFullName(gitHubOAuth2User.getFullName());
        phoneShopUser.setBio(gitHubOAuth2User.getBio());
        phoneShopUser.setAvatarUrl(gitHubOAuth2User.getAvatarUrl());
        phoneShopUser.setCompany(gitHubOAuth2User.getCompany());
        phoneShopUser.setLocation(gitHubOAuth2User.getLocation());
        phoneShopUser.setRole(Role.ROLE_USER);
        if (phoneShopUser.getDateRegistered() == null) {
            phoneShopUser.setDateRegistered(getCurrentTime());
        }
        phoneShopUserRepository.save(phoneShopUser);
    }

    private String getCurrentTime() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(DATE_TIME_FORMAT));
    }
}
