package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "maintenancechargesvo")
public class MaintenanceChargesVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "maintenanceChargesId")
    private int id;

    private String maintenanceType;

    private String Amount;

    @ManyToOne
    @JoinColumn(name = "maintenanceId")
    private MaintenanceVo maintenanceVo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaintenanceType() {
        return maintenanceType;
    }

    public void setMaintenanceType(String maintenanceType) {
        this.maintenanceType = maintenanceType;
    }

    public String getAmount() {
        return Amount;
    }

    public void setAmount(String amount) {
        Amount = amount;
    }

    public MaintenanceVo getMaintenanceVo() {
        return maintenanceVo;
    }

    public void setMaintenanceVo(MaintenanceVo maintenanceVo) {
        this.maintenanceVo = maintenanceVo;
    }
}
