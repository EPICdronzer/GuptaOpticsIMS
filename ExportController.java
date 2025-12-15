package com.springBootnew.controller;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springBootnew.dao.SaleDetailsDao;
import com.springBootnew.entities.SaleDetails;

import jakarta.servlet.http.HttpServletResponse;
@RestController
public class ExportController {
	@Autowired
    private SaleDetailsDao saleDao;

    @GetMapping("/export")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        String headerValue = "attachment; filename=sales_data.xlsx";
        response.setHeader("Content-Disposition", headerValue);

        List<SaleDetails> sales = (List<SaleDetails>) saleDao.findAll();

        XSSFWorkbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sales Data");

        // Create Header Row
        Row headerRow = sheet.createRow(0);
        String[] columns = {"Sale ID", "Customer Name", "Phone Number", "Status", "Notes", "Date", "Time","Pending Amount","Paid Amount","Total Amount"};

        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
        }

        // Fill Data
        int rowIdx = 1;
        for (SaleDetails sale : sales) {
            Row row = sheet.createRow(rowIdx++);
            row.createCell(0).setCellValue(sale.getSaleId());
            row.createCell(1).setCellValue(sale.getCustomerName());
            row.createCell(2).setCellValue(sale.getPhoneNumber());
            row.createCell(3).setCellValue(sale.getStatus());
            row.createCell(4).setCellValue(sale.getNotes() != null ? sale.getNotes() : "");
            row.createCell(5).setCellValue(sale.getSaleDate().toString());
            row.createCell(6).setCellValue(sale.getSaleTime().toString());
            row.createCell(7).setCellValue(sale.getPendingAmount());
            row.createCell(8).setCellValue(sale.getPaidAmount());
            row.createCell(9).setCellValue(sale.getTotalAmount());
        }

        workbook.write(response.getOutputStream());
        workbook.close();
    }
}
