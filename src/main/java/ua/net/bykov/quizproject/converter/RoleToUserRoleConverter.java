package ua.net.bykov.quizproject.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import ua.net.bykov.quizproject.model.Role;
import ua.net.bykov.quizproject.service.RoleService;

/**
 * A converter class used in views to map id's to actual Role objects.
 */
@Component
public class RoleToUserRoleConverter implements Converter<Object, Role> {

    static final Logger logger = LoggerFactory.getLogger(RoleToUserRoleConverter.class);

    @Autowired
    RoleService roleService;

    /**
     * Gets Role by Id
     *
     * @see org.springframework.core.convert.converter.Converter#convert(java.lang.Object)
     */
    public Role convert(Object element) {
        Integer id = Integer.parseInt((String) element);
        Role profile = roleService.findById(id);
        logger.info("Role : {}", profile);
        return profile;
    }

}