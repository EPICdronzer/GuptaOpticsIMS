<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Optical Galaxy</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #4c1d95 50%, #0f172a 100%);
            color: #fff;
            overflow-x: hidden;
        }

        /* Navigation */
        nav {
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            padding: 1.5rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: all 0.3s ease;
        }

        nav.scrolled {
            background: rgba(15, 23, 42, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 5%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            color: #e2e8f0;
            text-decoration: none;
            transition: color 0.3s;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #8b5cf6;
        }

        .nav-btn {
            padding: 0.75rem 1.5rem;
            background: linear-gradient(135deg, #8b5cf6, #3b82f6);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .nav-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(139, 92, 246, 0.4);
        }

        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 5%;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            max-width: 1200px;
            text-align: center;
            z-index: 10;
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #fff, #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.25rem;
            color: #cbd5e1;
            margin-bottom: 2rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-primary {
            padding: 1rem 2rem;
            background: linear-gradient(135deg, #8b5cf6, #3b82f6);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(139, 92, 246, 0.5);
        }

        .btn-secondary {
            padding: 1rem 2rem;
            background: transparent;
            border: 2px solid #8b5cf6;
            border-radius: 12px;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-secondary:hover {
            background: rgba(139, 92, 246, 0.1);
            transform: translateY(-3px);
        }

        /* Floating Elements */
        .floating-element {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.3;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .element-1 {
            width: 300px;
            height: 300px;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6);
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .element-2 {
            width: 200px;
            height: 200px;
            background: linear-gradient(135deg, #ec4899, #8b5cf6);
            bottom: 20%;
            right: 15%;
            animation-delay: 2s;
        }

        /* Stats Section */
        .stats {
            padding: 4rem 5%;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s;
            animation: fadeInUp 1s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 10px 30px rgba(139, 92, 246, 0.3);
        }

        .stat-value {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #3b82f6, #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #cbd5e1;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .stat-change {
            color: #10b981;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .stat-change.negative {
            color: #ef4444;
        }

        /* Features Section */
        .features {
            padding: 6rem 5%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 3rem;
            background: linear-gradient(135deg, #fff, #8b5cf6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 2.5rem;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #3b82f6, #8b5cf6, #ec4899);
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .feature-card:hover::before {
            transform: scaleX(1);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 20px 40px rgba(139, 92, 246, 0.3);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }

        .icon-blue { background: linear-gradient(135deg, #3b82f6, #06b6d4); }
        .icon-purple { background: linear-gradient(135deg, #8b5cf6, #ec4899); }
        .icon-orange { background: linear-gradient(135deg, #f97316, #ef4444); }
        .icon-green { background: linear-gradient(135deg, #10b981, #059669); }

        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #fff;
        }

        .feature-card p {
            color: #cbd5e1;
            line-height: 1.6;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .menu-toggle {
                display: block;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .cta-buttons {
                flex-direction: column;
            }

            .stats {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav id="navbar">
        <div class="logo">
            <span>👓</span>
            OG
        </div>
        <ul class="nav-links">
            <li><a href="show">View Order</a></li>
            <li><a href="add">Add Order</a></li>
            <li><a href="export">Download Excel</a></li>
            <li><a href="#features">Features</a></li>
            <li><a href="#btnview">Calculations</a></li>
        </ul>
        <button class="nav-btn" onclick="window.location.href='support'">Support</button>
    </nav>

    <section class="hero">
    <div class="floating-element element-1"></div>
    <div class="floating-element element-2"></div>
    
    <div class="hero-content">
        <h1>Optical Galaxy: Smart Inventory for Optical Retailers</h1>
        <p>Manage your eyewear stock effortlessly with Optical Galaxy. Track inventory, optimize sales, and enhance customer satisfaction with our specialized solution for optical stores.</p>
        <div class="cta-buttons">
            <button class="btn-primary" onclick="window.location.href='add'">Add Order</button>
            <button class="btn-secondary" id="btnview" onclick="window.location.href='show'">View Order</button>
        </div>
    </div>
</section>

    <section class="stats">
        <div class="stat-card">
            <div class="stat-value">${pending}</div>
            <div class="stat-label">Pending Orders</div>
        </div>
        <div class="stat-card">
            <div class="stat-value">Rs. ${cost}</div>
            <div class="stat-label">Sales Record</div>
        </div>
        <div class="stat-card">
            <div class="stat-value">${customer}</div>
            <div class="stat-label">Customers</div>
        </div>
        
    </section>

    <section class="features" id="features">
        <h2 class="section-title">Powerful Features for Modern Optical Stores</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon icon-blue">📦</div>
                <h3>Smart Inventory</h3>
                <p>Real-time tracking of frames, lenses, and accessories with automated reordering and low-stock alerts.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon icon-purple">📊</div>
                <h3>Analytics Dashboard</h3>
                <p>Comprehensive insights into sales trends, popular styles, and stock movements to make data-driven decisions.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon icon-orange">👥</div>
                <h3>Customer Management</h3>
                <p>Track prescriptions, preferences, and purchase history in one centralized, secure platform.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon icon-green">🛒</div>
                <h3>Point of Sale</h3>
                <p>Streamlined checkout process with integrated payment processing and automatic receipt generation.</p>
            </div>
        </div>
    </section>

    <script>
        // Navbar scroll effect
        window.addEventListener('scroll', () => {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Add animation on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -100px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.feature-card, .stat-card').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';
            el.style.transition = 'all 0.6s ease';
            observer.observe(el);
        });
    </script>
</body>
</html>