package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "notificationvo")
public class NotificationVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "notificationId")
    private int id;

    private String subject;

    private String description;

    private boolean readStatus=false;

    private boolean status=true;

    private String dataAndTime;

    @ManyToOne
    @JoinColumn(name = "ownerId")
    private OwnerVo ownerVo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isReadStatus() {
        return readStatus;
    }

    public void setReadStatus(boolean readStatus) {
        this.readStatus = readStatus;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDataAndTime() {
        return dataAndTime;
    }

    public void setDataAndTime(String dataAndTime) {
        this.dataAndTime = dataAndTime;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }
}
