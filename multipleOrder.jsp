<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,com.springBootnew.entities.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders List</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            position: relative;
        }

        .header .back {
            position: absolute;
            left: 30px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 2rem;
            color: white;
            text-decoration: none;
            transition: all 0.3s;
            z-index: 10;
        }

        .header .back:hover {
            color: rgba(255, 255, 255, 0.8);
            transform: translateY(-50%) scale(1.15);
        }

        .header-content {
            text-align: center;
        }

        .header-content h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .header-content p {
            opacity: 0.9;
            font-size: 1rem;
        }

        .content {
            padding: 40px;
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            gap: 20px;
            flex-wrap: wrap;
        }

        .search-box {
            flex: 1;
            min-width: 250px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 12px 45px 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .search-box input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .search-box i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 1.2rem;
        }

        .filter-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .filter-group select {
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            cursor: pointer;
            background: white;
        }

        .filter-group select:focus {
            outline: none;
            border-color: #667eea;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        thead th {
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tbody tr {
            border-bottom: 1px solid #e0e0e0;
            transition: all 0.3s;
        }

        tbody tr:hover {
            background: #f8f9fa;
        }

        tbody td {
            padding: 18px 15px;
            font-size: 0.95rem;
            color: #333;
        }

        .order-id {
            font-weight: 600;
            color: #667eea;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            text-align: center;
        }

        .status-pending {
            background: #fff3cd;
            color: #856404;
        }

        .status-completed {
            background: #d4edda;
            color: #155724;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-action {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-view {
            background: #17a2b8;
            color: white;
        }

        .btn-view:hover {
            background: #138496;
            transform: scale(1.1);
        }

        .btn-edit {
            background: #667eea;
            color: white;
        }

        .btn-edit:hover {
            background: #5568d3;
            transform: scale(1.1);
        }

        .btn-delete {
            background: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background: #c82333;
            transform: scale(1.1);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #666;
        }

        .empty-state p {
            font-size: 1rem;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 30px;
        }

        .pagination button {
            padding: 10px 15px;
            border: 2px solid #667eea;
            background: white;
            color: #667eea;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
        }

        .pagination button:hover:not(:disabled) {
            background: #667eea;
            color: white;
        }

        .pagination button:disabled {
            opacity: 0.3;
            cursor: not-allowed;
        }

        .pagination .page-info {
            padding: 10px 15px;
            color: #666;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .header .back {
                left: 15px;
                font-size: 1.5rem;
            }

            .content {
                padding: 20px;
            }

            .controls {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                width: 100%;
            }

            .filter-group {
                width: 100%;
            }

            .filter-group select {
                flex: 1;
            }

            .table-container {
                border: none;
            }

            table {
                font-size: 0.85rem;
            }

            thead th,
            tbody td {
                padding: 12px 8px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-action {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<script>
function filterTable() {
	  const filter = document.getElementById("statusFilter").value.toLowerCase();
	  const table = document.getElementById("ordersTable");
	  const rows = table.getElementsByTagName("tr");

	  for (let i = 1; i < rows.length; i++) { 
	    const statusCell = rows[i].getElementsByTagName("td")[6]; 
	    if (statusCell) {
	      const statusText = statusCell.textContent.trim().toLowerCase();
	      if (filter === "" || statusText === filter) {
	        rows[i].style.display = ""; 
	      } else {
	        rows[i].style.display = "none"; 
	      }
	    }
	  }
	}
	
	function filterSearchTable() {
	  const filter = document.getElementById("searchInput").value.toLowerCase();
	  const table = document.getElementById("ordersTable");
	  const rows = table.getElementsByTagName("tr");

	  for (let i = 1; i < rows.length; i++) { 
	      const statusText = rows[i].textContent.trim().toLowerCase();
	      if (statusText.includes(filter)) {
	        rows[i].style.display = ""; 
	      } else {
	        rows[i].style.display = "none"; 
	      }
	  }
	}
</script>
    <%
    	
        List<SaleDetails> list=(List<SaleDetails>)request.getAttribute("details");
    
    %>

    <div class="container">
        <div class="header">
            <a href="home" class="back" title="Back to Home">
                <i class="bi bi-arrow-left-circle-fill"></i>
            </a>
            <div class="header-content">
                <h1>👓 All Orders</h1>
                <p>View and manage customer orders</p>
            </div>
        </div>

        <div class="content">
            <!-- Search and Filter Controls -->
            <div class="controls">
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Search by Order ID, Name, or Phone..." onkeyup="filterSearchTable()">
                    <i class="bi bi-search"></i>
                </div>
                <div class="filter-group">
                    <select id="statusFilter" onchange="filterTable()">
                        <option value="">All Status</option>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                    </select>
                </div>
            </div>

            <div class="table-container">
                <table id="ordersTable">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer Name</th>
                            <th>Phone Number</th>
                            <th>Order Date</th>
                            <th>Order Time</th>
                            <th>Pending Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                       for(SaleDetails sls:list){
                    	   String name = sls.getCustomerName();
                    	    if (sls.getKnown().equals("true")) {
                    	        name += "*";
                    	    }
                        %>
                        <tr>
                            <td class="order-id"><%= sls.getSaleId() %></td>
                            <td><%= name %></td>
                            <td><%= sls.getPhoneNumber() %></td>
                            <td><%= sls.getSaleDate() %></td>
                            <td><%= sls.getSaleTime().toLocalTime() %></td>
                            <td>Rs. <%= sls.getPendingAmount() %></td>
                            <td>
							    <span class="status-badge <%= sls.getStatus().equalsIgnoreCase("Completed") ? "status-completed" : "status-pending" %>">
							        <%= sls.getStatus() %>
							    </span>
							</td>

                            <td>
                                <div class="action-buttons">
                                    <button class="btn-action btn-view" onclick="window.location.href='open/<%= sls.getSaleId() %>'" title="View Details">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <button class="btn-action btn-edit" onclick="window.location.href='edit/<%= sls.getSaleId() %>'" title="Edit Order">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <button class="btn-action btn-delete" onclick="if(confirm('Are you sure you want to delete this order?')) { window.location.href='<%= request.getContextPath() %>/delete/<%= sls.getSaleId() %>'; }" title="Delete Order">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <%
                    	   	
                       	}
                        %>
                    </tbody>
                </table>
                
                <% if (list.size() == 0) { %>
                <div class="empty-state">
                    <i class="bi bi-inbox"></i>
                    <h3>No Orders Found</h3>
                    <p>Start by adding a new sale order</p>
                </div>
                <% 
                	} 
                %>
            </div>

            
            <div class="pagination">
                
                <span class="page-info">Page <span id="currentPage">1</span> of <span id="totalPages">1</span></span>
                
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+YFLQj3v1q7QaQm8F8M0Jx7p4cJ8p" crossorigin="anonymous"></script>
</body>
</html>