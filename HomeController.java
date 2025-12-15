package com.springBootnew.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springBootnew.dao.SaleDetailsDao;
import com.springBootnew.entities.SaleDetails;
import com.springBootnew.service.UpdateService;

@Controller("homeControllerMain")
public class HomeController {

	@Autowired
	private SaleDetailsDao sale;

	@GetMapping("/home")
	public String home(Model model) {
		List<Double> pendingOrder = sale.pendingOrder();
	    double pending = (pendingOrder != null && !pendingOrder.isEmpty() && pendingOrder.get(0) != null)?pendingOrder.get(0):0.0;
	    model.addAttribute("pending", pending);

	    List<Double> totalCost = sale.totalCost();
	    double cost = (totalCost != null && !totalCost.isEmpty() && totalCost.get(0) != null)? totalCost.get(0) : 0.0;
	    model.addAttribute("cost", cost);

	    model.addAttribute("customer", sale.totalCustomer());

	    return "home";
	}

	@RequestMapping("/add")
	public String add() {
		return "add";
	}

	@RequestMapping("/save")
	public String doneForm(@ModelAttribute SaleDetails sls) {
		System.out.println("Known value received: " + sls.getKnown());
		sale.save(sls);
		return "redirect:/home";
	}

	@RequestMapping("/show")
	public String openOrders(Model model) {
		List<SaleDetails> all = (List<SaleDetails>) sale.findAll();
		model.addAttribute("details",all);
		return "multipleOrder";
	}

	@RequestMapping("/open/{id}")
	public String showOrder(@PathVariable int id,Model model) {
		SaleDetails detail = sale.findById(id).orElseThrow(() -> new RuntimeException("Sale not found with ID " + id));
		model.addAttribute("detail",detail);
		return "showOrder";

	}

	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable int id,Model model) {
		SaleDetails detail = sale.findById(id).orElseThrow(() -> new RuntimeException("Sale not found with ID " + id));
		model.addAttribute("detail",detail);
		return "editPage";

	}

	@Autowired
	private UpdateService upd;
	@PostMapping("/update")
	public String updateSale(@ModelAttribute SaleDetails saleUpdatedData) {
		upd.updateDetail(saleUpdatedData);
		return "redirect:/show";

	}

	@GetMapping("/delete/{id}")
	public String deletePage(@PathVariable int id) {
		sale.deleteById(id);
		return "redirect:/show";

	}
	
	@GetMapping("/support")
	public String supportPage() {
		return "support";

	}

	
//	@GetMapping("/search")
//	@ResponseBody
//	public List<SaleDetails> searchSales(@org.springframework.web.bind.annotation.RequestParam("keyword") String keyword) {
//	    if (keyword == null || keyword.trim().isEmpty()) {
//	        return (List<SaleDetails>) sale.findAll();
//	    }
//	    return sale.findByCustomerNameContainingIgnoreCase(keyword);
//	}

	



}
