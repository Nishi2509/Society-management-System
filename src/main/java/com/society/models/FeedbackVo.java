package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "feedbackvo")
public class FeedbackVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "feedbackId")
    private int id;

    @Column(name = "rating")
    private String rating;

    @Column(name = "description")
    private String description;

    @Column(name = "date")
    private String date;

    @ManyToOne
    @JoinColumn(name = "ownerId")
    private OwnerVo ownerVo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }
}
