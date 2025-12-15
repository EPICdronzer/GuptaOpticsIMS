<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Sale - Optical Inventory</title>
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
            text-align: center;
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

        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .header p {
            opacity: 0.9;
            font-size: 1rem;
        }

        .form-container {
            padding: 40px;
        }

        .section {
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

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
            font-size: 0.95rem;
        }

        .required::after {
            content: ' *';
            color: #e74c3c;
        }

        input[type="text"],
        input[type="tel"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            font-family: inherit;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 80px;
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

        /* Checkbox toggle switch styling */
        .checkbox-wrapper {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 10px;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 56px;
            height: 28px;
        }

        .toggle-switch input[type="checkbox"] {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.3s;
            border-radius: 28px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 20px;
            width: 20px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.3s;
            border-radius: 50%;
        }

        input[type="checkbox"]:checked + .toggle-slider {
            background-color: #667eea;
        }

        input[type="checkbox"]:checked + .toggle-slider:before {
            transform: translateX(28px);
        }

        .toggle-label {
            font-weight: 600;
            color: #666;
            font-size: 0.95rem;
            user-select: none;
        }

        input[type="checkbox"]:checked ~ .toggle-label {
            color: #667eea;
        }

        .button-group {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid #e0e0e0;
        }

        button {
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

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-secondary {
            background: #e0e0e0;
            color: #333;
        }

        .btn-secondary:hover {
            background: #d0d0d0;
        }

        .info-text {
            font-size: 0.85rem;
            color: #666;
            font-style: italic;
            margin-top: 5px;
        }

        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #28a745;
        }

        @media (max-width: 768px) {
            .header .back {
                left: 15px;
                font-size: 1.5rem;
            }

            .form-container {
                padding: 20px;
            }

            .eye-section {
                grid-template-columns: 1fr;
            }

            .power-row {
                grid-template-columns: 1fr;
            }

            .button-group {
                flex-direction: column;
            }

            button {
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
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <a href="home" class="back" title="Back to Home">
                <i class="bi bi-arrow-left-circle-fill"></i>
            </a>
            <h1>👓 Add New Sale</h1>
            <p>Record customer purchase and prescription details</p>
        </div>
		
        <div class="form-container">
            <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
            <div class="success-message">
                ✓ Sale record added successfully!
            </div>
            <% } %>

            <form method="post" action="save">
                <div class="section">
                    <div class="section-title">
                        <span>Customer Information</span>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="customerName" class="required">Customer Name</label>
                            <input type="text" id="customerName" name="customerName" required placeholder="Enter full name">
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber" class="required">Phone Number</label>
                            <input type="tel" id="phoneNumber" name="phoneNumber" required placeholder="+91 9876543210" pattern="[0-9+\-\s]{10,15}">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
						    <label for="known">Known Customer</label>
						    <div class="radio-group">
						        <div class="radio-option">
						            <input type="radio" id="knownY" name="known" value="true" required>
						            <label for="knownY">Yes</label>
						        </div>
						        <div class="radio-option">
						            <input type="radio" id="knownN" name="known" value="false" required checked>
						            <label for="knownN">No</label>
						        </div>
						    </div>
						    <span class="info-text">Is this a returning customer?</span>
						</div>


                        <div class="form-group">
                            <label for="address">Address (Optional)</label>
                            <textarea id="address" name="address" placeholder="Enter customer address"></textarea>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <div class="section-title">
                        <span>Prescription Details</span>
                    </div>

                    <div class="eye-section">
                        <div class="eye-box">
                            <h4>👁️ Right Eye (OD)</h4>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="od_sphere">Sphere (SPH)</label>
                                    <input type="number" id="od_sphere" name="odSphereR" step="0.25" value="0.00" min="-20" max="20">
                                </div>
                                <div class="power-group">
                                    <label for="od_cylinder">Cylinder (CYL)</label>
                                    <input type="number" id="od_cylinder" name="odCylinderR" step="0.25" value="0.00" min="-6" max="6">
                                </div>
                                <div class="power-group">
                                    <label for="od_axis">Axis</label>
                                    <input type="number" id="od_axis" name="odAxisR" value="0" min="0" max="180">
                                </div>
                            </div>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="od_add">Add</label>
                                    <input type="number" id="od_add" name="odAddR" step="0.25" value="0.00" min="0" max="4">
                                </div>
                            </div>
                        </div>

                        <div class="eye-box">
                            <h4>👁️ Left Eye (OS)</h4>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="os_sphere">Sphere (SPH)</label>
                                    <input type="number" id="os_sphere" name="osSphereL" step="0.25" value="0.00" min="-20" max="20">
                                </div>
                                <div class="power-group">
                                    <label for="os_cylinder">Cylinder (CYL)</label>
                                    <input type="number" id="os_cylinder" name="osCylinderL" step="0.25" value="0.00" min="-6" max="6">
                                </div>
                                <div class="power-group">
                                    <label for="os_axis">Axis</label>
                                    <input type="number" id="os_axis" name="osAxisL" value="0" min="0" max="180">
                                </div>
                            </div>
                            <div class="power-row">
                                <div class="power-group">
                                    <label for="os_add">Add</label>
                                    <input type="number" id="os_add" name="osAddL" step="0.25" value="0.00" min="0" max="4">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row" style="margin-top: 20px;">
                        <div class="form-group">
                            <label for="pd">Pupillary Distance (PD)</label>
                            <input type="number" id="pd" name="pdDistance" step="0.5" value="60.0" min="40" max="80">
                            <span class="info-text">Usually between 54-74mm</span>
                        </div>
                    </div>
                </div>

                <!-- Frame & Lens Details Section -->
                <div class="section">
                    <div class="section-title">
                        <span>Frame & Lens Details</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label >Frame Type (Optional)</label>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <input type="radio" id="frameMetal" name="frameType" value="Metal" >
                                    <label for="frameMetal">Metal</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" id="framePlastic" name="frameType" value="Plastic" >
                                    <label for="framePlastic">Plastic</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lensType" >Lens Type (Optional)</label>
                            <select id="lensType" name="lensType" >
                                <option value="">Select lens type</option>
                                <option value="Single Vision">Single Vision</option>
                                <option value="Bifocal">Bifocal</option>
                                <option value="Progressive">Progressive</option>
                                <option value="Reading">Reading</option>
                                <option value="Distance">Distance</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="lensCoating">Lens Coating (Optional)</label>
                            <select id="lensCoating" name="lensCoating">
                                <option value="">Select coating</option>
                                <option value="Anti-Reflective">Anti-Reflective</option>
                                <option value="Blue Cut">Blue Cut</option>
                                <option value="Photochromic">Photochromic</option>
                                <option value="Scratch Resistant">Scratch Resistant</option>
                                <option value="UV Protection">UV Protection</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="frameColor">Frame Color (Optional)</label>
                            <input type="text" id="frameColor" name="frameColor" placeholder="e.g., Black, Silver, Gold">
                        </div>
                    </div>
                </div>

                <!-- Sale Information Section -->
                <div class="section">
                    <div class="section-title">
                        <span>Sale Information</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="saleDate" class="required">Sale Date</label>
                            <input type="date" id="saleDate" name="saleDate" required value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                        </div>

                        <div class="form-group">
                            <label for="paidAmount">Paid Amount (₹)</label>
                            <input type="number" id="paidAmount" name="paidAmount" placeholder="0.00" min="0" step="0.01" oninput="calculateTotal()" value="0.0">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="pendingAmount">Pending Amount (₹)</label>
                            <input type="number" id="pendingAmount" name="pendingAmount" placeholder="0.00" min="0" step="0.01" oninput="calculateTotal()" value="0.0">
                        </div>

                        <div class="form-group">
                            <label for="totalAmount">Total Amount (₹)</label>
                            <input type="number" id="totalAmount" name="totalAmount" placeholder="0.00" min="0" step="0.01" readonly style="background-color: #f0f0f0; font-weight: 600; color: #667eea; " value=0.0>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="notes">Additional Notes (Optional)</label>
                            <textarea id="notes" name="notes" placeholder="Any special instructions or remarks"></textarea>
                        </div>
                    </div>
                </div>

                
                <div class="button-group">
                    <button type="reset" class="btn-secondary">
                        <span>↺</span>
                        Reset
                    </button>
                    <button type="submit" class="btn-primary">
                        <span>✓</span>
                        Save Sale
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>