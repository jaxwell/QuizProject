package ua.net.bykov.quizproject.model;

import java.io.Serializable;

public enum UserRoleType implements Serializable {

    STUDENT("STUDENT"),
    TUTOR("TUTOR"),
    ADVANCED_TUTOR("ADVANCED_TUTOR"),
    ADMIN("ADMIN");

    String userRoleType;

    private UserRoleType(String userRoleType) {
        this.userRoleType = userRoleType;
    }

    public String getUserRoleType() {
        return userRoleType;
    }

}
