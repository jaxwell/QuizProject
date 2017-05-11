package ua.net.bykov.quizproject.dao;

import ua.net.bykov.quizproject.model.Role;

import java.util.List;


public interface RoleDao {

    List<Role> findAll();

    Role findByType(String type);

    Role findById(int id);
}