<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support & Feedback</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 800px;
            width: 100%;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 30px;
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
        }

        .header .back:hover {
            color: rgba(255, 255, 255, 0.8);
            transform: translateY(-50%) scale(1.15);
        }

        .header i.bi-headset {
            font-size: 3rem;
            margin-bottom: 15px;
        }

        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .header p {
            opacity: 0.9;
            font-size: 1rem;
        }

        .content {
            padding: 40px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 0.95rem;
        }

        .form-group label .required {
            color: #dc3545;
            margin-left: 3px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        select.form-control {
            cursor: pointer;
            background: white;
        }

        .priority-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .priority-option {
            flex: 1;
            min-width: 150px;
        }

        .priority-option input[type="radio"] {
            display: none;
        }

        .priority-label {
            display: block;
            padding: 12px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
        }

        .priority-option input[type="radio"]:checked + .priority-label {
            border-color: #667eea;
            background: #667eea;
            color: white;
        }

        .priority-label:hover {
            border-color: #667eea;
        }

        .priority-low {
            color: #28a745;
        }

        .priority-medium {
            color: #ffc107;
        }

        .priority-high {
            color: #dc3545;
        }

        .btn-submit {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .info-box {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .info-box p {
            margin: 0;
            color: #666;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .char-counter {
            text-align: right;
            font-size: 0.85rem;
            color: #999;
            margin-top: 5px;
        }

        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: none;
            border: 1px solid #c3e6cb;
        }

        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: none;
            border: 1px solid #f5c6cb;
        }

        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .header .back {
                left: 15px;
                font-size: 1.5rem;
            }

            .header {
                padding: 30px 20px;
            }

            .header h1 {
                font-size: 1.5rem;
            }

            .content {
                padding: 25px 20px;
            }

            .priority-option {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <a href="home" class="back" title="Back to Home">
                <i class="bi bi-arrow-left-circle-fill"></i>
            </a>
            <i class="bi bi-headset"></i>
            <h1>Support & Feedback</h1>
            <p>We're here to help! Share your concerns with us</p>
        </div>

        <div class="content">
            <div id="successMessage" class="success-message">
                <i class="bi bi-check-circle-fill"></i> Your message has been submitted successfully! We'll get back to you soon.
            </div>

            <div id="errorMessage" class="error-message">
                <i class="bi bi-exclamation-triangle-fill"></i> Please fill in all required fields.
            </div>

            <div class="info-box">
                <p>
                    <i class="bi bi-info-circle"></i>
                    <strong>Need Help?</strong> Please provide as much detail as possible about your issue. 
                    Our support team typically responds within 24-48 hours.
                </p>
            </div>

            <form id="supportForm" action="https://formspree.io/f/mldgljjd" method="post" >
                <div class="form-group">
                    <label for="name">Your Name <span class="required">*</span></label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label for="category">Issue Category <span class="required">*</span></label>
                    <select id="category" name="category" class="form-control" required>
                        <option value="">Select a category</option>
                        <option value="bug">🐛 Bug Report</option>
                        <option value="feature">💡 Feature Request</option>
                        <option value="technical">⚙️ Technical Issue</option>
                        <option value="billing">💳 Billing & Payment</option>
                        <option value="account">👤 Account Related</option>
                        <option value="general">📝 General Inquiry</option>
                        <option value="other">🔧 Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Priority Level <span class="required">*</span></label>
                    <div class="priority-group">
                        <div class="priority-option">
                            <input type="radio" id="low" name="priority" value="low" checked>
                            <label for="low" class="priority-label priority-low">
                                <i class="bi bi-flag"></i> Low
                            </label>
                        </div>
                        <div class="priority-option">
                            <input type="radio" id="medium" name="priority" value="medium">
                            <label for="medium" class="priority-label priority-medium">
                                <i class="bi bi-flag-fill"></i> Medium
                            </label>
                        </div>
                        <div class="priority-option">
                            <input type="radio" id="high" name="priority" value="high">
                            <label for="high" class="priority-label priority-high">
                                <i class="bi bi-exclamation-triangle-fill"></i> High
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject">Subject <span class="required">*</span></label>
                    <input type="text" id="subject" name="subject" class="form-control" placeholder="Brief description of your issue" required maxlength="100">
                </div>

                <div class="form-group">
                    <label for="message">Detailed Description <span class="required">*</span></label>
                    <textarea id="message" name="message" class="form-control" placeholder="Please describe your issue in detail..." required maxlength="1000" onkeyup="updateCharCount()"></textarea>
                    <div class="char-counter">
                        <span id="charCount">0</span> / 1000 characters
                    </div>
                </div>


				<input type="hidden" name="_next" value="localhost:8080/home">
                <button type="submit" class="btn-submit">
                    <i class="bi bi-send-fill"></i>
                    Submit Support Request
                </button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+YFLQj3v1q7QaQm8F8M0Jx7p4cJ8p" crossorigin="anonymous"></script>
</body>
</html>