# 📚 ELEAS - E-Learning Exemption Application System

<div align="center">



**A comprehensive web-based system for managing class/lecture exemption applications at Universiti Teknologi MARA (UiTM)**

[![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://www.javascript.com/)

</div>

---

## 🎯 Project Overview

**ELEAS (E-Learning Exemption Application System)** is a web-based platform that digitizes the class/lecture exemption application process at Universiti Teknologi MARA (UiTM). Developed during an internship in collaboration with the **Academic Affairs Department (Hal Ehwal Akademik)**, this system replaces traditional paper-based workflows with an efficient, transparent digital solution.

### 🌟 Key Objectives
- Digitize the exemption application process
- Streamline multi-level approval workflows
- Enhance transparency and real-time tracking
- Reduce processing time and paperwork

---

## 📚 Project Story

### 🚀 The Beginning

This project emerged from a real need at UiTM's Academic Affairs Department. Students faced a cumbersome paper-based process for class exemptions involving multiple signatures, physical document routing, and unclear status tracking. ELEAS was created to solve these challenges through digital transformation.

### 👥 Team & Collaboration

The project was developed by a **two-person team** with specialized roles:



#### **Muhammad Ilyas Bin Amran** - Lead Developer & System Analyst
- Converted requirements into comprehensive technical documentation
- Single-handedly designed complete system architecture and UI/UX
- Solo implementation of entire codebase (**4.5 months**)
- Created all technical diagrams (Flowchart, Use Case, ERD, DFD)
- Developed combined SRS and SDD documentation

#### **Ahmad Musta'in Billah bin Mustafa** - Client Liaison & Requirements Specialist
- Primary contact with Academic Affairs Department
- Led sprint-by-sprint client collaboration sessions
- Conducted requirement elicitation meetings
- Maintained continuous stakeholder communication

### 📅 Development Timeline

**Total Duration**: ~4.5 months (135 days)

1. **Planning & Analysis** - Sprint-based agile methodology with Academic Affairs Department
2. **Design Phase** - Created flowcharts, use case diagrams, ERD, DFD, and UI/UX mockups
3. **Implementation** - Full-stack solo development of all features
4. **Documentation** - Combined SRS + SDD report for final submission

---

## ✨ Features

### 🎓 Student Module
- Submit exemption applications with supporting documents
- Add class/lecture details for each application
- Real-time status tracking across approval levels
- Download/print approved forms as PDF

### 👨‍🏫 Lecturer Module
- View and authorize pending student applications
- Provide comments and feedback
- Email notifications for new requests

### 👔 KPP (Program Coordinator) Module
- Validate lecturer-authorized applications
- Add program-level recommendations
- Monitor application statistics

### 🏛️ TRHEA (Academic Affairs) Module
- Final approval authority
- Comprehensive application overview and reports
- Generate analytics

### 🛡️ Admin Module
- User account management (Students, Lecturers, KPP, TRHEA)
- Program management
- System-wide reports and configuration

### 🎨 General Features
- Secure role-based access control
- Responsive design (mobile-friendly)
- Bilingual support (English/Bahasa Malaysia)
- Automated email notifications (PHPMailer)
- PDF generation for official documents
- DataTables for efficient data browsing

---

## 🏗️ System Architecture

### Application Flow
```
Student Application → Lecturer Authorization → KPP Validation → TRHEA Approval
         ↓                      ↓                      ↓                ↓
    Email Notify          Email Notify          Email Notify     Email Notify
```

### 👥 User Roles
1. **Student** - Submit and track applications
2. **Lecturer** - Authorize class-specific requests
3. **KPP (Program Coordinator)** - Validate and support applications
4. **TRHEA (Academic Affairs)** - Final approval authority
5. **Admin** - System management

---

## 🛠️ Technologies Used

### Frontend
- HTML5, CSS3, JavaScript (ES6)
- Bootstrap 5.3
- jQuery 3.6
- Font Awesome 6.1
- DataTables

### Backend
- PHP 7.4+
- PDO (Database abstraction)
- Sessions (Authentication)
- PHPMailer (Email)

### Database
- MySQL 5.7+

### Configuration
- Environment Variables (.env)
- Centralized config management

---

## ⚙️ Installation

### 📋 Prerequisites
- XAMPP (Apache, MySQL, PHP 7.4+)
- Composer (for PHPMailer)
- Modern web browser

### ⚡ Quick Setup

1. **Clone/Download Project**
```bash
cd C:\xampp\htdocs\
git clone [your-repo-url] eleas.uitm.edu.my
cd eleas.uitm.edu.my
```

2. **Create Environment File**
```bash
# Windows
copy env .env

# The env file already contains your configuration!
```

3. **Install Dependencies**
```bash
cd PHPMailer
composer install
cd ..
```

4. **Setup Database**
- Start XAMPP (Apache + MySQL)
- Open phpMyAdmin: `http://localhost/phpmyadmin`
- Create database: `eleas_v3`
- Import file: `eleas_v3.sql`

5. **Access System**
```
http://localhost/eleas.uitm.edu.my
```

### 🔐 Environment Configuration

Your `.env` file contains:
- **Database**: localhost, eleas_v3, root (no password)
- **Email**: Gmail SMTP with app password
- **App Settings**: Development mode with debugging enabled

**Security Note**: For production, change `APP_ENV=production` and `APP_DEBUG=false` in `.env`

---

## 📊 Database Schema

### 🗄️ Main Tables
- `students` - Student information
- `applications` - Exemption applications
- `classes` - Class/lecture details per application
- `lecturers` - Lecturer accounts
- `kpp` - Program coordinator accounts
- `trhea` - Academic affairs accounts
- `admins` - Administrator accounts
- `programs` - Academic programs

---

## 🎨 Design Documentation

### 📐 Documentation Created

- **Flowcharts** - Process flows for all user roles
- **Use Case Diagrams** - Actor interactions and system boundaries
- **Entity Relationship Diagram (ERD)** - Complete database schema
- **Data Flow Diagrams (DFD)** - Data movement through system layers
- **Combined SRS + SDD** - Final report documentation

---

## 🔧 Quick Troubleshooting

### ❌ Database Connection Error?
- Check MySQL is running in XAMPP
- Verify database `eleas_v3` exists
- Check `.env` has correct credentials

### ❌ Email Not Sending?
- Verify Gmail app password in `.env`
- Check internet connection
- Ensure port 587 is not blocked

### ❌ Can't Login?
- Clear browser cache/cookies
- Verify account exists in database

---

## 👨‍💻 Development Team

<table>
<tr>
<td align="center" width="50%">
<h3>Muhammad Ilyas Bin Amran</h3>
<em>Lead Developer & System Analyst</em><br><br>
Requirements documentation<br>
UI/UX design and architecture<br>
Full-stack implementation (4.5 months)<br>
Technical diagrams creator<br>
SRS + SDD documentation<br><br>
<strong>LinkedIn:</strong> <a href="https://www.linkedin.com/in/muhammad-ilyas-bin-amran/">Muhammad Ilyas Bin Amran</a><br>
<strong>GitHub:</strong> <a href="https://github.com/unatesta175">unatesta175</a><br>
<strong>Email:</strong> muhammadilyasamran@gmail.com<br>
<strong>WhatsApp:</strong> +60 11-1104 7614
</td>
<td align="center" width="50%">
<h3>Ahmad Musta'in Billah bin Mustafa</h3>
<em>Client Liaison & Requirements Specialist</em><br><br>
Primary client communicator<br>
Sprint facilitator<br>
Stakeholder relationship management<br>
Requirements validation<br><br>
<em>Collaborated with Academic Affairs Department (Hal Ehwal Akademik) throughout the project</em>
</td>
</tr>
</table>

### 🤝 Collaboration Model

Our **specialized dual-role model**:
- **Internal Transformation** (Ilyas): Technical specifications and implementation
- **External Collaboration** (Mustain): Client-facing activities, requirement gathering


**Development**: Agile with sprint-based planning | ~4.5 months (135 days)

---

## 🤝 Acknowledgments

### 🏛️ Institutional Support

**Universiti Teknologi MARA (UiTM)**
- For the internship opportunity and mentorship

**Academic Affairs Department (Hal Ehwal Akademik)**
- For continuous collaboration and domain expertise
- For patience during iterative requirement refinement

### 🙏 Special Thanks
- Academic supervisors for technical guidance
- Department staff for testing and feedback
- UiTM for facilitating this impactful project

---

## 📝 License

### 📄 Usage Rights

This project was developed as part of an **internship program** at Universiti Teknologi MARA (UiTM).

- **Academic Use**: Free for educational purposes
- **UiTM Use**: Fully authorized for deployment by UiTM
- **Commercial Use**: Requires permission from development team and UiTM

**Disclaimer**: This software is provided "as is", without warranty of any kind.

---

## 📞 Contact & Support

### 👨‍💻 Lead Developer

**Muhammad Ilyas Bin Amran** - Lead Developer & System Analyst

For questions, suggestions, or collaboration opportunities:

- **LinkedIn**: [Muhammad Ilyas Bin Amran](https://www.linkedin.com/in/muhammad-ilyas-bin-amran/)
- **GitHub**: [unatesta175](https://github.com/unatesta175)
- **Email**: muhammadilyasamran@gmail.com
- **WhatsApp**: +60 11-1104 7614

### 🏛️ For Academic/Official Inquiries

**Department**: Academic Affairs Department (Hal Ehwal Akademik)  
**Institution**: Universiti Teknologi MARA (UiTM)

---

## 🎓 Final Note

This project represents **4.5 months of intensive development**, countless hours of learning, and pushing personal boundaries. It's more than code—it's a testament to what dedicated individuals can achieve when solving real problems.

> *"The best way to predict the future is to implement it."*

**Thank you for exploring ELEAS!** 🚀

---

<div align="center">

**Developed with ❤️ for UiTM Academic Community**



**© 2024 ELEAS Development Team | Universiti Teknologi MARA**

*Empowering academic administration through technology*

</div>
