package ua.net.bykov.quizproject.service;

import ua.net.bykov.quizproject.model.User;

import java.util.List;

public interface UserService {

    User findById(int id);

    User findByEmail(String email);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserByEmail(String email);

    List<User> findAllUsers();

    boolean isUserEmailUnique(Integer id, String email);

}