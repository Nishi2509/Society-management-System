package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "maintenancevo")
public class MaintenanceVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "maintenanceId")
    private int id;

    @Column(name = "year")
    private String year;

    @Column(name = "month")
    private String month;

    @Column(name = "houseType")
    private String houseType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
}
