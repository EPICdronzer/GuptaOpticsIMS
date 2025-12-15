package com.springBootnew.entities;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class SaleDetails {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int saleId;


	@Column(nullable = false)
    private String saleDate;

	@CreationTimestamp
    private LocalDateTime saleTime;

	@Column(nullable = false, length = 255)
    private String customerName;

    @Column(nullable = false, length = 20)
    private String phoneNumber;

    @Column(columnDefinition = "TEXT")
    private String address;
    
    @Column(nullable = false, columnDefinition = "VARCHAR(10) DEFAULT 'false'")
    private String known;

 // ==================== RIGHT EYE PRESCRIPTION (OD) ====================

    private double odSphereR;


    private double odCylinderR;

    private double odAxisR;


    private double odAddR;

    // ==================== LEFT EYE PRESCRIPTION (OS) ====================

    private double osSphereL;

    private double osCylinderL;

    private double osAxisL;

    private double osAddL;

    // ==================== PUPILLARY DISTANCE ====================

    private double pdDistance;

    // ==================== FRAME DETAILS ====================

    @Column(length = 20)
    private String frameType;

    @Column(length = 50)
    private String frameColor;

    // ==================== LENS DETAILS ====================

    @Column(length = 50)
    private String lensType;

    @Column(length = 100)
    private String lensCoating;

    // Total
    private double pendingAmount;
    private double paidAmount;
    private double totalAmount;

    // Additional information

    @Column(name = "notes", columnDefinition = "TEXT")
    private String notes;

    @Column(nullable = false, columnDefinition = "varchar(20) default 'pending'")
    private String status = "pending";

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getSaleId() {
		return saleId;
	}

	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}



	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	public LocalDateTime getSaleTime() {
		return saleTime;
	}

	public void setSaleTime(LocalDateTime saleTime) {
		this.saleTime = saleTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getOdSphereR() {
		return odSphereR;
	}

	public void setOdSphereR(double odSphereR) {
		this.odSphereR = odSphereR;
	}

	public double getOdCylinderR() {
		return odCylinderR;
	}

	public void setOdCylinderR(double odCylinderR) {
		this.odCylinderR = odCylinderR;
	}

	public double getOdAxisR() {
		return odAxisR;
	}

	public void setOdAxisR(double odAxisR) {
		this.odAxisR = odAxisR;
	}

	public double getOdAddR() {
		return odAddR;
	}

	public void setOdAddR(double odAddR) {
		this.odAddR = odAddR;
	}

	public double getOsSphereL() {
		return osSphereL;
	}

	public void setOsSphereL(double osSphereL) {
		this.osSphereL = osSphereL;
	}

	public double getOsCylinderL() {
		return osCylinderL;
	}

	public void setOsCylinderL(double osCylinderL) {
		this.osCylinderL = osCylinderL;
	}

	public double getOsAxisL() {
		return osAxisL;
	}

	public void setOsAxisL(double osAxisL) {
		this.osAxisL = osAxisL;
	}

	public double getOsAddL() {
		return osAddL;
	}

	public void setOsAddL(double osAddL) {
		this.osAddL = osAddL;
	}

	public double getPdDistance() {
		return pdDistance;
	}

	public void setPdDistance(double pdDistance) {
		this.pdDistance = pdDistance;
	}

	public String getFrameType() {
		return frameType;
	}

	public void setFrameType(String frameType) {
		this.frameType = frameType;
	}

	public String getFrameColor() {
		return frameColor;
	}

	public void setFrameColor(String frameColor) {
		this.frameColor = frameColor;
	}

	public String getLensType() {
		return lensType;
	}

	public void setLensType(String lensType) {
		this.lensType = lensType;
	}

	public String getLensCoating() {
		return lensCoating;
	}

	public void setLensCoating(String lensCoating) {
		this.lensCoating = lensCoating;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}





	public double getPendingAmount() {
		return pendingAmount;
	}

	public void setPendingAmount(double pendingAmount) {
		this.pendingAmount = pendingAmount;
	}

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}

	

	public String getKnown() {
		return known;
	}

	public void setKnown(String known) {
		this.known = known;
	}

	

	@Override
	public String toString() {
		return "SaleDetails [saleId=" + saleId + ", saleDate=" + saleDate + ", saleTime=" + saleTime + ", customerName="
				+ customerName + ", phoneNumber=" + phoneNumber + ", address=" + address + ", known=" + known
				+ ", odSphereR=" + odSphereR + ", odCylinderR=" + odCylinderR + ", odAxisR=" + odAxisR + ", odAddR="
				+ odAddR + ", osSphereL=" + osSphereL + ", osCylinderL=" + osCylinderL + ", osAxisL=" + osAxisL
				+ ", osAddL=" + osAddL + ", pdDistance=" + pdDistance + ", frameType=" + frameType + ", frameColor="
				+ frameColor + ", lensType=" + lensType + ", lensCoating=" + lensCoating + ", pendingAmount="
				+ pendingAmount + ", paidAmount=" + paidAmount + ", totalAmount=" + totalAmount + ", notes=" + notes
				+ ", status=" + status + "]";
	}

	public SaleDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

}
