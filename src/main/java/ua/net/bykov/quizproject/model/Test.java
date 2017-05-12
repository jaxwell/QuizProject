package ua.net.bykov.quizproject.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Test {
    private long testId;
    private String title;
    private String description;
    private Integer questionTime;
    private byte active;
    private Collection<Question> questionsByTestId;
    private User userByTutorId;

    @Id
    @Column(name = "test_id")
    public long getTestId() {
        return testId;
    }

    public void setTestId(long testId) {
        this.testId = testId;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "question_time")
    public Integer getQuestionTime() {
        return questionTime;
    }

    public void setQuestionTime(Integer questionTime) {
        this.questionTime = questionTime;
    }

    @Basic
    @Column(name = "active")
    public byte getActive() {
        return active;
    }

    public void setActive(byte active) {
        this.active = active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Test test = (Test) o;

        if (testId != test.testId) return false;
        if (active != test.active) return false;
        if (title != null ? !title.equals(test.title) : test.title != null) return false;
        if (description != null ? !description.equals(test.description) : test.description != null) return false;
        if (questionTime != null ? !questionTime.equals(test.questionTime) : test.questionTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (testId ^ (testId >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (questionTime != null ? questionTime.hashCode() : 0);
        result = 31 * result + (int) active;
        return result;
    }

    @OneToMany(mappedBy = "testByTestId")
    public Collection<Question> getQuestionsByTestId() {
        return questionsByTestId;
    }

    public void setQuestionsByTestId(Collection<Question> questionsByTestId) {
        this.questionsByTestId = questionsByTestId;
    }

    @ManyToOne
    @JoinColumn(name = "tutor_id", referencedColumnName = "user_id", nullable = false)
    public User getUserByTutorId() {
        return userByTutorId;
    }

    public void setUserByTutorId(User userByTutorId) {
        this.userByTutorId = userByTutorId;
    }
}
