package ua.net.bykov.quizproject.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ua.net.bykov.quizproject.model.Role;

@Repository("userRoleDao")
public class RoleDaoImpl extends AbstractDao<Integer, Role> implements RoleDao {

    public Role findById(int id) {
        return getByKey(id);
    }

    public Role findByType(String type) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("type", type));
        return (Role) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<Role> findAll() {
        Criteria criteria = createEntityCriteria();
        criteria.addOrder(Order.asc("type"));
        return (List<Role>) criteria.list();
    }

}