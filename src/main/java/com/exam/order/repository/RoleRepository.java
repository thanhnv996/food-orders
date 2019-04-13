package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
