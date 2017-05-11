package ua.net.bykov.quizproject.service;

import ua.net.bykov.quizproject.model.Role;

import java.util.List;


public interface RoleService {

    Role findById(int id);

    Role findByType(String type);

    List<Role> findAll();

}