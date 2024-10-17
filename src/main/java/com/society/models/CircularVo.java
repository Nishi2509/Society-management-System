package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "circularvo")
public class CircularVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "circularId")
    private int id;

    @Column(name = "circluarCategory")
    private String category;

    @Column(name = "circularFromDate")
    private String circularFromDate;

    @Column(name = "circularFromTo")
    private String circularFromTo;

    @Column(name = "circularDescription")
    private String circularDescription;

    @Column(name = "circularAttactments")
    private String circularAttactments;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCircularFromDate() {
        return circularFromDate;
    }

    public void setCircularFromDate(String circularFromDate) {
        this.circularFromDate = circularFromDate;
    }

    public String getCircularFromTo() {
        return circularFromTo;
    }

    public void setCircularFromTo(String circularFromTo) {
        this.circularFromTo = circularFromTo;
    }

    public String getCircularDescription() {
        return circularDescription;
    }

    public void setCircularDescription(String circularDescription) {
        this.circularDescription = circularDescription;
    }

    public String getCircularAttactments() {
        return circularAttactments;
    }

    public void setCircularAttactments(String circularAttactments) {
        this.circularAttactments = circularAttactments;
    }
}
