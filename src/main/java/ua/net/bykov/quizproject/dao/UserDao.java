package ua.net.bykov.quizproject.dao;

import ua.net.bykov.quizproject.model.User;

import java.util.List;


public interface UserDao {

    User findById(int id);

    User findByEmail(String email);

    void save(User user);

    void deleteByEmail(String Email);

    List<User> findAllUsers();

}