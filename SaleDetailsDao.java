package com.springBootnew.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springBootnew.entities.SaleDetails;


@Repository
public interface SaleDetailsDao extends CrudRepository<SaleDetails, Integer> {


	@Query("SELECT COUNT(o) FROM SaleDetails o WHERE o.status = 'Pending'")
	public List<Double> pendingOrder();

    // Sum of totalAmount for completed orders
    @Query("SELECT COALESCE(SUM(o.totalAmount), 0) FROM SaleDetails o WHERE o.status = 'Completed'")
    public List<Double> totalCost();

    // Count distinct customers for completed orders
    @Query("SELECT COUNT(DISTINCT o.customerName) FROM SaleDetails o WHERE o.status = 'Completed'")
    public long totalCustomer();
    
//    List<SaleDetails> findByCustomerNameContainingIgnoreCase(String keyword);
}
