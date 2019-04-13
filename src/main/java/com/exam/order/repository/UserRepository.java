package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
