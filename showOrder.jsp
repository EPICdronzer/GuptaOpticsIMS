<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date,com.springBootnew.entities.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Order</title>
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
            max-width: 1200px;
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
            display: inline-block;
            line-height: 1;
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

        .header-content .order-id {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .content {
            padding: 40px;
        }

        .status-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8f9fa;
            padding: 20px 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            border: 2px solid #e0e0e0;
        }

        .status-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .status-badge {
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .status-pending {
            background: #fff3cd;
            color: #856404;
        }

        .status-completed {
            background: #d4edda;
            color: #155724;
        }

        .status-actions button {
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 0.95rem;
        }

        .btn-complete {
            background: #28a745;
            color: white;
        }

        .btn-complete:hover {
            background: #218838;
            transform: translateY(-2px);
        }

        .btn-pending {
            background: #ffc107;
            color: #333;
        }

        .btn-pending:hover {
            background: #e0a800;
            transform: translateY(-2px);
        }

        .section {
            margin-bottom: 35px;
        }

        .section-title {
            font-size: 1.3rem;
            color: #667eea;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #667eea;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title::before {
            content: '';
            width: 8px;
            height: 8px;
            background: #667eea;
            border-radius: 50%;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .info-label {
            font-size: 0.85rem;
            color: #666;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: 1.1rem;
            color: #333;
            font-weight: 500;
        }

        .info-value.empty {
            color: #999;
            font-style: italic;
        }

        .eye-prescription {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-top: 20px;
        }

        .eye-box {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
        }

        .eye-box h4 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .prescription-detail {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .prescription-detail:last-child {
            border-bottom: none;
        }

        .prescription-label {
            color: #666;
            font-weight: 600;
        }

        .prescription-value {
            color: #333;
            font-weight: 500;
        }

        .notes-box {
            background: #fff8e1;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #ffc107;
            margin-top: 15px;
        }

        .notes-box .label {
            font-weight: 600;
            color: #856404;
            margin-bottom: 10px;
        }

        .notes-box .content {
            color: #333;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 2px solid #e0e0e0;
        }

        .action-buttons button {
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-print {
            background: #17a2b8;
            color: white;
        }

        .btn-print:hover {
            background: #138496;
            transform: translateY(-2px);
        }

        .btn-edit {
            background: #667eea;
            color: white;
        }

        .btn-edit:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }

        .btn-delete {
            background: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background: #c82333;
            transform: translateY(-2px);
        }

        .timestamp {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #666;
            font-size: 0.95rem;
        }

        .amount-display {
            font-size: 1.5rem;
            color: #28a745;
            font-weight: 700;
        }

        @media (max-width: 768px) {
            .header .back {
                left: 15px;
                font-size: 1.5rem;
            }

            .content {
                padding: 20px;
            }

            .status-bar {
                flex-direction: column;
                gap: 15px;
                align-items: stretch;
            }

            .status-actions {
                width: 100%;
            }

            .status-actions button {
                width: 100%;
            }

            .eye-prescription {
                grid-template-columns: 1fr;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-buttons button {
                width: 100%;
                justify-content: center;
            }
        }

        @media print {
            body {
                background: white;
                padding: 0;
            }

            .header .back,
            .status-actions,
            .action-buttons {
                display: none !important;
            }

            .container {
                box-shadow: none;
            }
        }
    </style>
</head>
<body>
    <%
        SaleDetails detail = (SaleDetails)request.getAttribute("detail");
    %>

    <div class="container">
        <div class="header">
            <a href="<%= ((HttpServletRequest) request).getContextPath() %>/show" class="back" title="Back to Orders">
			    <i class="bi bi-arrow-left-circle-fill"></i>
			</a>

            <div class="header-content">
                <h1>👓 Order Details</h1>
                <p class="order-id">Order ID: <strong><%= detail.getSaleId() %></strong></p>
            </div>
        </div>

        <div class="content">
            <div class="status-bar">
                <div class="status-info">
                    <div class="status-badge <%= detail.getStatus().equalsIgnoreCase("Completed") ? "status-completed" : "status-pending" %>">
                        <i class="bi <%= detail.getStatus().equalsIgnoreCase("Completed") ? "bi-check-circle-fill" : "bi-clock-fill" %>"></i>
                        <%= detail.getStatus() %>
                    </div>
                    <div class="timestamp">
                        <i class="bi bi-calendar3"></i>
                        <%= detail.getSaleDate()%> at <%= detail.getSaleTime().toLocalTime() %>
                    </div>
                </div>
                <div class="status-actions">
                    <form method="post" action="<%= request.getContextPath() %>/edit/<%= detail.getSaleId() %>" style="display: inline;">
                        <input type="hidden" name="saleId" value="<%= detail.getSaleId() %>">
                        <% if (detail.getStatus().equalsIgnoreCase("Pending")) { %>
                            <input type="hidden" name="newStatus" value="Completed">
                            <button type="submit" class="btn-complete">
                                <i class="bi bi-check-circle"></i>
                                Mark as Completed
                            </button>
                        <% } else { %>
                            <input type="hidden" name="newStatus" value="Pending">
                            <button type="submit" class="btn-pending">
                                <i class="bi bi-arrow-counterclockwise"></i>
                                Mark as Pending
                            </button>
                        <% } %>
                    </form>
                </div>
            </div>

            <!-- Customer Information -->
            <div class="section">
                <div class="section-title">
                    <span>Customer Information</span>
                </div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Customer Name</div>
                        <div class="info-value"><%= detail.getCustomerName() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Phone Number</div>
                        <div class="info-value"><%= detail.getPhoneNumber() %></div>
                    </div>
                    <div class="info-item" style="grid-column: 1 / -1;">
                        <div class="info-label">Address</div>
                        <div class="info-value"><%= detail.getAddress() != null && !detail.getAddress().isEmpty() ? detail.getAddress() : "<span class='empty'>Not provided</span>" %></div>
                    </div>
                </div>
            </div>

            <!-- Prescription Details -->
            <div class="section">
                <div class="section-title">
                    <span>Prescription Details</span>
                </div>
                <div class="eye-prescription">
                    <!-- Right Eye -->
                    <div class="eye-box">
                        <h4>👁️ Right Eye (OD)</h4>
                        <div class="prescription-detail">
                            <span class="prescription-label">Sphere (SPH)</span>
                            <span class="prescription-value"><%= detail.getOdSphereR() %></span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Cylinder (CYL)</span>
                            <span class="prescription-value"><%= detail.getOdCylinderR() %></span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Axis</span>
                            <span class="prescription-value"><%= detail.getOdAxisR() %>°</span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Add</span>
                            <span class="prescription-value"><%= detail.getOdAddR() %></span>
                        </div>
                    </div>

                    <!-- Left Eye -->
                    <div class="eye-box">
                        <h4>👁️ Left Eye (OS)</h4>
                        <div class="prescription-detail">
                            <span class="prescription-label">Sphere (SPH)</span>
                            <span class="prescription-value"><%= detail.getOsSphereL() %></span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Cylinder (CYL)</span>
                            <span class="prescription-value"><%= detail.getOsCylinderL() %></span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Axis</span>
                            <span class="prescription-value"><%= detail.getOsAxisL() %>°</span>
                        </div>
                        <div class="prescription-detail">
                            <span class="prescription-label">Add</span>
                            <span class="prescription-value"><%= detail.getOsAddL() %></span>
                        </div>
                    </div>
                </div>

                <div class="info-grid" style="margin-top: 20px;">
                    <div class="info-item">
                        <div class="info-label">Pupillary Distance (PD)</div>
                        <div class="info-value"><%= detail.getPdDistance() %> mm</div>
                    </div>
                </div>
            </div>

            <!-- Frame & Lens Details -->
            <div class="section">
                <div class="section-title">
                    <span>Frame & Lens Details</span>
                </div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Frame Type</div>
                        <div class="info-value"><%= detail.getFrameType() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Lens Type</div>
                        <div class="info-value"><%= detail.getLensType() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Lens Coating</div>
                        <div class="info-value"><%= detail.getLensCoating() != null && !detail.getLensCoating().isEmpty() ? detail.getLensCoating() : "<span class='empty'>None</span>" %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Frame Color</div>
                        <div class="info-value"><%= detail.getFrameColor() != null && !detail.getFrameColor().isEmpty() ? detail.getFrameColor() : "<span class='empty'>Not specified</span>" %></div>
                    </div>
                </div>
            </div>

            <!-- Sale Information -->
            <div class="section">
                <div class="section-title">
                    <span>Sale Information</span>
                </div>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label">Sale Date</div>
                        <div class="info-value"><%= detail.getSaleDate() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Sale Time</div>
                        <div class="info-value"><%= detail.getSaleTime() %></div>
                    </div>
                    <div class="info-item">
                    	<div class="info-label">Pending Amount</div>
                        <div class="info-value amount-display">₹<%= detail.getPendingAmount() %></div>
                    	<div class="info-label">Paid Amount</div>
                        <div class="info-value amount-display">₹<%= detail.getPaidAmount() %></div>
                        <hr>
                        <div class="info-label">Total Amount</div>
                        <div class="info-value amount-display">₹<%= detail.getTotalAmount() %></div>
                    </div>
                </div>

                <% if (detail.getNotes() != null && !detail.getNotes().isEmpty()) { %>
                <div class="notes-box">
                    <div class="label">
                        <i class="bi bi-sticky"></i> Additional Notes
                    </div>
                    <div class="content"><%= detail.getNotes() %></div>
                </div>
                <% } %>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <button type="button" class="btn-print" onclick="window.print()">
                    <i class="bi bi-printer"></i>
                    Print Order
                </button>
                <button type="button" class="btn-edit" onclick="window.location.href = '<%= request.getContextPath() %>/edit/<%= detail.getSaleId() %>'">
                    <i class="bi bi-pencil-square"></i>
                    Edit Order
                </button>
                <button type="button" class="btn-delete" onclick="if(confirm('Are you sure you want to delete this order?')) { window.location.href='<%= request.getContextPath() %>/delete/<%= detail.getSaleId() %>'; }">
                    <i class="bi bi-trash"></i>
                    Delete Order
                </button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+YFLQj3v1q7QaQm8F8M0Jx7p4cJ8p" crossorigin="anonymous"></script>
</body>
</html>