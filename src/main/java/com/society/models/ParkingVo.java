package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "parkingvo")
public class ParkingVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "parkingId")
    private int id;

    @Column(name = "parkingName")
    private String parkingName;

    @ManyToOne
    @JoinColumn(name = "blockId")
    private BlockVo blockVo;

    @ManyToOne
    @JoinColumn(name = "ownerId")
    private OwnerVo ownerVo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParkingName() {
        return parkingName;
    }

    public void setParkingName(String parkingName) {
        this.parkingName = parkingName;
    }

    public BlockVo getBlockVo() {
        return blockVo;
    }

    public void setBlockVo(BlockVo blockVo) {
        this.blockVo = blockVo;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }
}
