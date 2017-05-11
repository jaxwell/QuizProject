package ua.net.bykov.quizproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.net.bykov.quizproject.dao.RoleDao;
import ua.net.bykov.quizproject.model.Role;

@Service("userRoleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao dao;

    public Role findById(int id) {
        return dao.findById(id);
    }

    public Role findByType(String type) {
        return dao.findByType(type);
    }

    public List<Role> findAll() {
        return dao.findAll();
    }
}
