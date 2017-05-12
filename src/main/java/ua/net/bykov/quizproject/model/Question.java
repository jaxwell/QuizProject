package ua.net.bykov.quizproject.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by ievge on 5/12/2017.
 */
@Entity
public class Question {
    private long questionId;
    private long testId;
    private String question;
    private byte active;
    private Collection<Answer> answersByQuestionId;
    private Test testByTestId;

    @Id
    @Column(name = "question_id")
    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
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
    @Column(name = "question")
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
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

        Question question1 = (Question) o;

        if (questionId != question1.questionId) return false;
        if (testId != question1.testId) return false;
        if (active != question1.active) return false;
        if (question != null ? !question.equals(question1.question) : question1.question != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (questionId ^ (questionId >>> 32));
        result = 31 * result + (int) (testId ^ (testId >>> 32));
        result = 31 * result + (question != null ? question.hashCode() : 0);
        result = 31 * result + (int) active;
        return result;
    }

    @OneToMany(mappedBy = "questionByQuestionId")
    public Collection<Answer> getAnswersByQuestionId() {
        return answersByQuestionId;
    }

    public void setAnswersByQuestionId(Collection<Answer> answersByQuestionId) {
        this.answersByQuestionId = answersByQuestionId;
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
