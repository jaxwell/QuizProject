package ua.net.bykov.quizproject.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ievge on 5/12/2017.
 */
@Entity
public class Answer {
    private long answerId;
    private long questionId;
    private String text;
    private byte correct;
    private Byte active;
    private Timestamp created;
    private Timestamp updated;
    private Question questionByQuestionId;

    @Id
    @Column(name = "answer_id")
    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
    }

    @Basic
    @Column(name = "question_id")
    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    @Basic
    @Column(name = "text")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Basic
    @Column(name = "correct")
    public byte getCorrect() {
        return correct;
    }

    public void setCorrect(byte correct) {
        this.correct = correct;
    }

    @Basic
    @Column(name = "active")
    public Byte getActive() {
        return active;
    }

    public void setActive(Byte active) {
        this.active = active;
    }

    @Basic
    @Column(name = "created")
    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    @Basic
    @Column(name = "updated")
    public Timestamp getUpdated() {
        return updated;
    }

    public void setUpdated(Timestamp updated) {
        this.updated = updated;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Answer answer = (Answer) o;

        if (answerId != answer.answerId) return false;
        if (questionId != answer.questionId) return false;
        if (correct != answer.correct) return false;
        if (text != null ? !text.equals(answer.text) : answer.text != null) return false;
        if (active != null ? !active.equals(answer.active) : answer.active != null) return false;
        if (created != null ? !created.equals(answer.created) : answer.created != null) return false;
        if (updated != null ? !updated.equals(answer.updated) : answer.updated != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (answerId ^ (answerId >>> 32));
        result = 31 * result + (int) (questionId ^ (questionId >>> 32));
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (int) correct;
        result = 31 * result + (active != null ? active.hashCode() : 0);
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (updated != null ? updated.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "question_id", referencedColumnName = "question_id", nullable = false)
    public Question getQuestionByQuestionId() {
        return questionByQuestionId;
    }

    public void setQuestionByQuestionId(Question questionByQuestionId) {
        this.questionByQuestionId = questionByQuestionId;
    }
}
