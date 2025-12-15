package com.springBootnew.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBootnew.dao.SaleDetailsDao;
import com.springBootnew.entities.SaleDetails;

import jakarta.transaction.Transactional;
@Service
public class UpdateService {
	@Autowired
	private SaleDetailsDao saleDetailsDao;

	@Transactional
	public void updateDetail(SaleDetails sale) {
		SaleDetails existingSale = saleDetailsDao.findById(sale.getSaleId())
		        .orElseThrow(() -> new RuntimeException("Sale not found with ID " + sale.getSaleId()));

		// Customer Information
        existingSale.setCustomerName(sale.getCustomerName());
        existingSale.setPhoneNumber(sale.getPhoneNumber());
        existingSale.setKnown(sale.getKnown());
        existingSale.setAddress(sale.getAddress());
        
        // Prescription Details - Right Eye (OD)
        existingSale.setOdSphereR(sale.getOdSphereR());
        existingSale.setOdCylinderR(sale.getOdCylinderR());
        existingSale.setOdAxisR(sale.getOdAxisR());
        existingSale.setOdAddR(sale.getOdAddR());
        
        // Prescription Details - Left Eye (OS)
        existingSale.setOsSphereL(sale.getOsSphereL());
        existingSale.setOsCylinderL(sale.getOsCylinderL());
        existingSale.setOsAxisL(sale.getOsAxisL());
        existingSale.setOsAddL(sale.getOsAddL());
        
        // Pupillary Distance
        existingSale.setPdDistance(sale.getPdDistance());
        
        // Frame & Lens Details
        existingSale.setFrameType(sale.getFrameType());
        existingSale.setLensType(sale.getLensType());
        existingSale.setLensCoating(sale.getLensCoating());
        existingSale.setFrameColor(sale.getFrameColor());
        
	    existingSale.setStatus(sale.getStatus());
	    double paid = sale.getPaidAmount();
	    double pending = sale.getPendingAmount();

	    if (sale.getStatus().equalsIgnoreCase("Completed")) {
	        paid = sale.getTotalAmount();  
	        pending = 0;
	    }

	    existingSale.setPaidAmount(paid);
	    existingSale.setPendingAmount(pending);
	    existingSale.setTotalAmount(paid + pending);
	    
	   saleDetailsDao.save(existingSale);
	}
}
