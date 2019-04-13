package com.exam.order.service;

import com.exam.order.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
