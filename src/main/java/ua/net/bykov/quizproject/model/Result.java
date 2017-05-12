package ua.net.bykov.quizproject.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ievge on 5/12/2017.
 */
@Entity
public class Result {
    private long resultId;
    private long testId;
    private String result;
    private byte active;
    private User userByUserId;
    private Test testByTestId;

    @Id
    @Column(name = "result_id")
    public long getResultId() {
        return resultId;
    }

    public void setResultId(long resultId) {
        this.resultId = resultId;
    }

    @Basic
    @Column(name = "test_id")
    public long getTestId() {
        return testId;
    }

    public void setTestId(long testId) {
        this.testId = testId;
    }

    @Basic
    @Column(name = "result")
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
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

        Result result1 = (Result) o;

        if (resultId != result1.resultId) return false;
        if (testId != result1.testId) return false;
        if (active != result1.active) return false;
        if (result != null ? !result.equals(result1.result) : result1.result != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result1 = (int) (resultId ^ (resultId >>> 32));
        result1 = 31 * result1 + (int) (testId ^ (testId >>> 32));
        result1 = 31 * result1 + (result != null ? result.hashCode() : 0);
        result1 = 31 * result1 + (int) active;
        return result1;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "test_id", referencedColumnName = "test_id", nullable = false)
    public Test getTestByTestId() {
        return testByTestId;
    }

    public void setTestByTestId(Test testByTestId) {
        this.testByTestId = testByTestId;
    }
}
