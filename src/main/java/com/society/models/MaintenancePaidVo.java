package com.society.models;

import javax.persistence.*;
import java.security.acl.Owner;

@Entity
@Table(name = "maintenancepaidvo")
public class MaintenancePaidVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    private String year;

    private String month;

    private boolean maintenanceStatus = false;

    @ManyToOne
    @JoinColumn(name = "ownerId")
    private OwnerVo ownerVo;

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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public boolean isMaintenanceStatus() {
        return maintenanceStatus;
    }

    public void setMaintenanceStatus(boolean maintenanceStatus) {
        this.maintenanceStatus = maintenanceStatus;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }
}
