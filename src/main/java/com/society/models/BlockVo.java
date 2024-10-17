package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "blockvo")
public class BlockVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "blockId")
    private int id;

    @Column(name = "blockName")
    private String blockName;

    @Column(name = "noOfFloors")
    private String noOfFloors;

    @Column(name = "houseOnEachFloor")
    private String houseOnEachFloor;

    @Column(name = "typeOfHouse")
    private String typeOfHouse;

    @Column(name = "status")
    private Boolean status = true;

    @Column(name = "twoWheelerParkingSpace")
    private String twoWheelerParkingSpace;

    @Column(name = "fourWheelerParkingSpace")
    private String fourWheelerParkingSpace;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBlockName() {
        return blockName;
    }

    public void setBlockName(String blockName) {
        this.blockName = blockName;
    }

    public String getNoOfFloors() {
        return noOfFloors;
    }

    public void setNoOfFloors(String noOfFloors) {
        this.noOfFloors = noOfFloors;
    }

    public String getHouseOnEachFloor() {
        return houseOnEachFloor;
    }

    public void setHouseOnEachFloor(String houseOnEachFloor) {
        this.houseOnEachFloor = houseOnEachFloor;
    }

    public String getTypeOfHouse() {
        return typeOfHouse;
    }

    public void setTypeOfHouse(String typeOfHouse) {
        this.typeOfHouse = typeOfHouse;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getTwoWheelerParkingSpace() {
        return twoWheelerParkingSpace;
    }

    public void setTwoWheelerParkingSpace(String twoWheelerParkingSpace) {
        this.twoWheelerParkingSpace = twoWheelerParkingSpace;
    }

    public String getFourWheelerParkingSpace() {
        return fourWheelerParkingSpace;
    }

    public void setFourWheelerParkingSpace(String fourWheelerParkingSpace) {
        this.fourWheelerParkingSpace = fourWheelerParkingSpace;
    }

}
