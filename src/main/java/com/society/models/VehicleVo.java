package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "vehiclevo")
public class VehicleVo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "vehicleId")
    private int id;

    @Column(name = "vehicleType")
    private String vehicleType;

    @Column(name = "vehicleNumberPlate")
    private String vehicleNumberPlate;

    @Column(name = "vehicleRCNumber")
    private String vehicleRCNumber;

    @Column(name = "vehicleImageFileName")
    private String vehicleImageFileName;

    @Column(name = "allocatedParkingSpace")
    private String allocatedParkingSpace;

    @ManyToOne
    @JoinColumn(name = "ownerId")
    private OwnerVo ownerVo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleNumberPlate() {
        return vehicleNumberPlate;
    }

    public void setVehicleNumberPlate(String vehicleNumberPlate) {
        this.vehicleNumberPlate = vehicleNumberPlate;
    }

    public String getVehicleRCNumber() {
        return vehicleRCNumber;
    }

    public void setVehicleRCNumber(String vehicleRCNumber) {
        this.vehicleRCNumber = vehicleRCNumber;
    }

    public String getVehicleImageFileName() {
        return vehicleImageFileName;
    }

    public void setVehicleImageFileName(String vehicleImageFileName) {
        this.vehicleImageFileName = vehicleImageFileName;
    }

    public OwnerVo getOwnerVo() {
        return ownerVo;
    }

    public void setOwnerVo(OwnerVo ownerVo) {
        this.ownerVo = ownerVo;
    }

    public String getAllocatedParkingSpace() {
        return allocatedParkingSpace;
    }

    public void setAllocatedParkingSpace(String allocatedParkingSpace) {
        this.allocatedParkingSpace = allocatedParkingSpace;
    }
}
