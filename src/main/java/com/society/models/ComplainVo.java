package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "complainvo")
public class ComplainVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "complainId")
    private int id;

    @Column(name = "subject")
    private String subject;

    @Column(name = "description")
    private String description;

    @Column(name = "complainStatus")
    private String complainStatus;

    @Column(name = "status")
    private boolean status;

    @Column(name = "comaplainDateAndTime")
    private String complainDateAndTime;

    @Column(name = "reply")
    private String reply;

    @Column(name = "replyDateAndTime")
    private String replyDateAndTime;

    @Column(name = "complainAttachments")
    private String complainAttachments;

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

    public String getComplainStatus() {
        return complainStatus;
    }

    public void setComplainStatus(String complainStatus) {
        this.complainStatus = complainStatus;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getComplainDateAndTime() {
        return complainDateAndTime;
    }

    public void setComplainDateAndTime(String complainDateAndTime) {
        this.complainDateAndTime = complainDateAndTime;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyDateAndTime() {
        return replyDateAndTime;
    }

    public void setReplyDateAndTime(String replyDateAndTime) {
        this.replyDateAndTime = replyDateAndTime;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }

    public String getComplainAttachments() {
        return complainAttachments;
    }

    public void setComplainAttachments(String complainAttachments) {
        this.complainAttachments = complainAttachments;
    }
}
