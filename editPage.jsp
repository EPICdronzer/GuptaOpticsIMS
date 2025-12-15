<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.springBootnew.entities.*" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Order - Optical Inventory</title>
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
            max-width: 1000px;
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

        .form-section {
            margin-bottom: 40px;
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 0.95rem;
        }

        .required::after {
            content: ' *';
            color: #e74c3c;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            font-family: inherit;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-group input[readonly] {
            background-color: #f0f0f0;
            font-weight: 600;
            color: #667eea;
            cursor: not-allowed;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        .radio-option input[type="radio"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #667eea;
        }

        .radio-option label {
            margin: 0;
            cursor: pointer;
            font-weight: 500;
        }

        .eye-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-top: 20px;
        }

        .eye-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 12px;
            border: 2px solid #e0e0e0;
        }

        .eye-box h4 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .power-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-bottom: 15px;
        }

        .power-group {
            display: flex;
            flex-direction: column;
        }

        .power-group label {
            font-size: 0.85rem;
            margin-bottom: 5px;
            color: #666;
        }

        .power-group input {
            padding: 10px;
            font-size: 0.95rem;
        }

        .status-selector {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .status-option {
            flex: 1;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            position: relative;
        }

        .status-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        .status-option:hover {
            border-color: #667eea;
            background: #f8f9fa;
        }

        .status-option input[type="radio"]:checked + .status-label {
            color: white;
        }

        .status-option input[type="radio"]:checked ~ * {
            color: white;
        }

        .status-option.pending:has(input[type="radio"]:checked) {
            background: #ffc107;
            border-color: #ffc107;
        }

        .status-option.completed:has(input[type="radio"]:checked) {
            background: #28a745;
            border-color: #28a745;
        }

        .status-label {
            font-weight: 600;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .button-group {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid #e0e0e0;
        }

        .btn {
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        .order-info-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border: 2px solid #e0e0e0;
        }

        .order-info-card .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .order-info-card .info-row:last-child {
            border-bottom: none;
        }

        .order-info-card .info-label {
            font-weight: 600;
            color: #666;
        }

        .order-info-card .info-value {
            color: #333;
        }

        .info-text {
            font-size: 0.85rem;
            color: #666;
            font-style: italic;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .header .back {
                left: 15px;
                font-size: 1.5rem;
            }

            .content {
                padding: 20px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .eye-section {
                grid-template-columns: 1fr;
            }

            .power-row {
                grid-template-columns: 1fr;
            }

            .status-selector {
                flex-direction: column;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
    <script>
        function calculateTotal() {
            const paidAmount = parseFloat(document.getElementById('paidAmount').value) || 0;
            const pendingAmount = parseFloat(document.getElementById('pendingAmount').value) || 0;
            const totalAmount = paidAmount + pendingAmount;
            
            document.getElementById('totalAmount').value = totalAmount.toFixed(2);
        }

        window.addEventListener('DOMContentLoaded', function() {
            calculateTotal();
        });
    </script>
</head>
<body>
    <%
        SaleDetails detail = (SaleDetails) request.getAttribute("detail");
    %>

    <div class="container">
        <div class="header">
            <a href="<%= ((HttpServletRequest) request).getContextPath() %>/show" class="back" title="Back to Orders">
                <i class="bi bi-arrow-left-circle-fill"></i>
            </a>
            <div class="header-content">
                <h1>📝 Edit Order Details</h1>
                <p>Update customer information, prescription, and order details</p>
            </div>
        </div>

        <div class="content">
            <% if (detail != null) { %>
            <div class="order-info-card">
                <div class="info-row">
                    <span class="info-label">Order ID:</span>
                    <span class="info-value"><strong><%= detail.getSaleId() %></strong></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Created Date:</span>
                    <span class="info-value"><%= detail.getSaleDate() %></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Created Time:</span>
                    <span class="info-value"><%= detail.getSaleTime().toLocalTime() %></span>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/update" method="post">
                <input type="hidden" name="saleId" value="<%= detail.getSaleId() %>">

                <!-- Customer Information -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Customer Information</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="customerName" class="required">Customer Name</label>
                            <input type="text" id="customerName" name="customerName" 
                                   value="<%= detail.getCustomerName() != null ? detail.getCustomerName() : "" %>" 
                                   required placeholder="Enter full name">
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber" class="required">Phone Number</label>
                            <input type="tel" id="phoneNumber" name="phoneNumber" 
                                   value="<%= detail.getPhoneNumber() != null ? detail.getPhoneNumber() : "" %>" 
                                   required placeholder="+91 9876543210" pattern="[0-9+\-\s]{10,15}">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="known">Known Customer</label>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <input type="radio" id="knownY" name="known" value="true" 
                                           <%= "true".equals(detail.getKnown()) ? "checked" : "" %>>
                                    <label for="knownY">Yes</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" id="knownN" name="known" value="false" 
                                           <%= "false".equals(detail.getKnown()) || detail.getKnown() == null ? "checked" : "" %>>
                                    <label for="knownN">No</label>
                                </div>
                            </div>
                            <span class="info-text">Is this a returning customer?</span>
                        </div>

                        <div class="form-group">
                            <label for="address">Address (Optional)</label>
                            <textarea id="address" name="address" placeholder="Enter customer address"><%= detail.getAddress() != null ? detail.getAddress() : "" %></textarea>
                        </div>
                    </div>
                </div>

                <!-- Prescription Details -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Prescription Details</span>
                    </div>

                    <div class="eye-section">
                        <div class="eye-box">
                            <h4>👁️ Right Eye (OD)</h4>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="od_sphere">Sphere (SPH)</label>
                                    <input type="number" id="od_sphere" name="odSphereR" step="0.25" 
                                           value="<%= detail.getOdSphereR() %>" 
                                           min="-20" max="20">
                                </div>
                                <div class="power-group">
                                    <label for="od_cylinder">Cylinder (CYL)</label>
                                    <input type="number" id="od_cylinder" name="odCylinderR" step="0.25" 
                                           value="<%= detail.getOdCylinderR() %>" 
                                           min="-6" max="6">
                                </div>
                                <div class="power-group">
                                    <label for="od_axis">Axis</label>
                                    <input type="number" id="od_axis" name="odAxisR" 
                                           value="<%= detail.getOdAxisR()%>" 
                                           min="0" max="180">
                                </div>
                            </div>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="od_add">Add</label>
                                    <input type="number" id="od_add" name="odAddR" step="0.25" 
                                           value="<%= detail.getOdAddR() %>" 
                                           min="0" max="4">
                                </div>
                            </div>
                        </div>

                        <div class="eye-box">
                            <h4>👁️ Left Eye (OS)</h4>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="os_sphere">Sphere (SPH)</label>
                                    <input type="number" id="os_sphere" name="osSphereL" step="0.25" 
                                           value="<%= detail.getOsSphereL() %>" 
                                           min="-20" max="20">
                                </div>
                                <div class="power-group">
                                    <label for="os_cylinder">Cylinder (CYL)</label>
                                    <input type="number" id="os_cylinder" name="osCylinderL" step="0.25" 
                                           value="<%= detail.getOsCylinderL() %>" 
                                           min="-6" max="6">
                                </div>
                                <div class="power-group">
                                    <label for="os_axis">Axis</label>
                                    <input type="number" id="os_axis" name="osAxisL" 
                                           value="<%= detail.getOsAxisL()%>" 
                                           min="0" max="180">
                                </div>
                            </div>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="os_add">Add</label>
                                    <input type="number" id="os_add" name="osAddL" step="0.25" 
                                           value="<%= detail.getOsAddL()  %>" 
                                           min="0" max="4">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row" style="margin-top: 20px;">
                        <div class="form-group">
                            <label for="pd">Pupillary Distance (PD)</label>
                            <input type="number" id="pd" name="pdDistance" step="0.5" 
                                   value="<%= detail.getPdDistance() %>" 
                                   min="40" max="80">
                            <span class="info-text">Usually between 54-74mm</span>
                        </div>
                    </div>
                </div>

                <!-- Frame & Lens Details -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Frame & Lens Details</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Frame Type (Optional)</label>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <input type="radio" id="frameMetal" name="frameType" value="Metal" 
                                           <%= "Metal".equals(detail.getFrameType()) ? "checked" : "" %>>
                                    <label for="frameMetal">Metal</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" id="framePlastic" name="frameType" value="Plastic" 
                                           <%= "Plastic".equals(detail.getFrameType()) ? "checked" : "" %>>
                                    <label for="framePlastic">Plastic</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lensType">Lens Type (Optional)</label>
                            <select id="lensType" name="lensType">
                                <option value="">Select lens type</option>
                                <option value="Single Vision" <%= "Single Vision".equals(detail.getLensType()) ? "selected" : "" %>>Single Vision</option>
                                <option value="Bifocal" <%= "Bifocal".equals(detail.getLensType()) ? "selected" : "" %>>Bifocal</option>
                                <option value="Progressive" <%= "Progressive".equals(detail.getLensType()) ? "selected" : "" %>>Progressive</option>
                                <option value="Reading" <%= "Reading".equals(detail.getLensType()) ? "selected" : "" %>>Reading</option>
                                <option value="Distance" <%= "Distance".equals(detail.getLensType()) ? "selected" : "" %>>Distance</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="lensCoating">Lens Coating (Optional)</label>
                            <select id="lensCoating" name="lensCoating">
                                <option value="">Select coating</option>
                                <option value="Anti-Reflective" <%= "Anti-Reflective".equals(detail.getLensCoating()) ? "selected" : "" %>>Anti-Reflective</option>
                                <option value="Blue Cut" <%= "Blue Cut".equals(detail.getLensCoating()) ? "selected" : "" %>>Blue Cut</option>
                                <option value="Photochromic" <%= "Photochromic".equals(detail.getLensCoating()) ? "selected" : "" %>>Photochromic</option>
                                <option value="Scratch Resistant" <%= "Scratch Resistant".equals(detail.getLensCoating()) ? "selected" : "" %>>Scratch Resistant</option>
                                <option value="UV Protection" <%= "UV Protection".equals(detail.getLensCoating()) ? "selected" : "" %>>UV Protection</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="frameColor">Frame Color (Optional)</label>
                            <input type="text" id="frameColor" name="frameColor" 
                                   value="<%= detail.getFrameColor() != null ? detail.getFrameColor() : "" %>" 
                                   placeholder="e.g., Black, Silver, Gold">
                        </div>
                    </div>
                </div>

                <!-- Payment Information -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Payment Information</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="paidAmount">Paid Amount (₹)</label>
                            <input type="number" id="paidAmount" name="paidAmount" 
                                   value="<%= detail.getPaidAmount() != 0.0 ? detail.getPaidAmount() : 0 %>" 
                                   min="0" step="0.01" oninput="calculateTotal()">
                        </div>

                        <div class="form-group">
                            <label for="pendingAmount">Pending Amount (₹)</label>
                            <input type="number" id="pendingAmount" name="pendingAmount" 
                                   value="<%= detail.getPendingAmount() != 0.0 ? detail.getPendingAmount() : 0 %>" 
                                   min="0" step="0.01" oninput="calculateTotal()">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="totalAmount">Total Amount (₹)</label>
                            <input type="number" id="totalAmount" name="totalAmount" 
                                   value="<%= detail.getTotalAmount() != 0.0 ? detail.getTotalAmount() : 0 %>" 
                                   min="0" step="0.01" readonly>
                        </div>
                    </div>
                </div>

                <!-- Order Status -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Order Status</span>
                    </div>

                    <div class="form-group">
                        <label>Update Status<span class="required">*</span></label>
                        <div class="status-selector">
                            <label class="status-option pending">
                                <input type="radio" name="status" value="Pending" 
                                       <%= detail.getStatus().equalsIgnoreCase("Pending") ? "checked" : "" %> required>
                                <div class="status-label">
                                    <i class="bi bi-clock-history"></i>
                                    <span>Pending</span>
                                </div>
                            </label>

                            <label class="status-option completed">
                                <input type="radio" name="status" value="Completed" 
                                       <%= detail.getStatus().equalsIgnoreCase("Completed") ? "checked" : "" %> required>
                                <div class="status-label">
                                    <i class="bi bi-check-circle"></i>
                                    <span>Completed</span>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Additional Notes -->
                <div class="form-section">
                    <div class="section-title">
                        <span>Additional Notes</span>
                    </div>

                    <div class="form-group full-width">
                        <label for="notes">Order Notes (Optional)</label>
                        <textarea id="notes" name="notes" placeholder="Any special instructions or remarks"><%= detail.getNotes() != null ? detail.getNotes() : "" %></textarea>
                    </div>
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='<%= ((HttpServletRequest) request).getContextPath() %>/show'">
                        <i class="bi bi-x-circle"></i>
                        <span>Cancel</span>
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-check-circle"></i>
                        <span>Update Order</span>
                    </button>
                </div>
            </form>
            <% } else { %>
            <div class="alert alert-error">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <span>Order not found. Please try again.</span>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>