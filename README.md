# OpenAutonomousDashboard

A Spring Boot web application with JSP frontend and MySQL database integration for autonomous dashboard functionality.

![Main Page](images/mainpage.png)

## 📋 Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Development](#development)
- [Building for Production](#building-for-production)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- Web-based dashboard interface
- MySQL database integration with JPA/Hibernate
- JSP-based frontend with JSTL support
- RESTful API architecture
- Hot reload development support
- Maven-based build system
- Tomcat embedded server

## 🛠 Technology Stack

- **Backend Framework:** Spring Boot 3.2.2
- **Java Version:** 17
- **Database:** MySQL 8.0.31
- **ORM:** Spring Data JPA / Hibernate
- **Frontend:** JSP with JSTL 3.0
- **Build Tool:** Maven 3.9.5
- **Server:** Apache Tomcat (Embedded)
- **Development Tools:** Spring Boot DevTools

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- Java 17 or higher
- Maven 3.6 or higher
- MySQL 8.0 or higher
- Git (for version control)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd OpenAutonomousDashboard
```

### 2. Set up MySQL Database

Create a new MySQL database:

```sql
CREATE DATABASE autonomous_dashboard;
CREATE USER 'dashboard_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON autonomous_dashboard.* TO 'dashboard_user'@'localhost';
FLUSH PRIVILEGES;
```

### 3. Configure Application Properties

Create `src/main/resources/application.properties` file:

```properties
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/autonomous_dashboard
spring.datasource.username=dashboard_user
spring.datasource.password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA/Hibernate Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect

# JSP Configuration
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# Server Configuration
server.port=8080
server.servlet.context-path=/dashboard

# Development Configuration
spring.devtools.restart.enabled=true
spring.devtools.livereload.enabled=true
```

## ⚙️ Configuration

### Environment-Specific Configuration

For different environments, you can create separate property files:

- `application-dev.properties` (Development)
- `application-prod.properties` (Production)
- `application-test.properties` (Testing)

### JSP View Configuration

Create JSP files in `src/main/webapp/WEB-INF/views/` directory.

## 🏃‍♂️ Running the Application

### Development Mode

Using Maven wrapper (recommended):

```bash
# Linux/Mac
./mvnw spring-boot:run

# Windows
mvnw.cmd spring-boot:run
```

Using Maven directly:

```bash
mvn spring-boot:run
```

### Using IDE

Import the project into your favorite IDE (IntelliJ IDEA, Eclipse, VS Code) and run the main application class.

### Access the Application

Once started, access the application at:
- **URL:** http://localhost:8080/dashboard
- **Health Check:** http://localhost:8080/dashboard/actuator/health (if actuator is enabled)

## 📁 Project Structure

```
OpenAutonomousDashboard/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/
│   │   │       └── OpenAutonomousDashboard/
│   │   │           ├── OpenAutonomousDashboardApplication.java
│   │   │           ├── controller/
│   │   │           ├── service/
│   │   │           ├── repository/
│   │   │           └── model/
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   └── static/
│   │   │       ├── css/
│   │   │       ├── js/
│   │   │       └── images/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── views/
│   │               └── *.jsp
│   └── test/
│       └── java/
├── target/
├── .mvn/
├── pom.xml
├── mvnw
├── mvnw.cmd
└── README.md
```

## 🔌 API Endpoints

Document your API endpoints here. Example:

```
GET    /api/dashboard          - Get dashboard data
POST   /api/dashboard          - Create new dashboard entry
PUT    /api/dashboard/{id}     - Update dashboard entry
DELETE /api/dashboard/{id}     - Delete dashboard entry
```

## 🗃️ Database Schema

Document your database tables and relationships here.

## 🔧 Development

### Hot Reload

The application includes Spring Boot DevTools for automatic restart and live reload during development.

### Adding New Dependencies

Add dependencies to `pom.xml` and run:

```bash
./mvnw dependency:resolve
```

### Running Tests

```bash
./mvnw test
```

### Code Style

Follow Java coding conventions and Spring Boot best practices.

## 🏗️ Building for Production

### Create WAR file

```bash
./mvnw clean package
```

The WAR file will be created in the `target/` directory.

### Deploy to External Tomcat

1. Build the WAR file
2. Copy `target/OpenAutonomousDashboard-0.0.1-SNAPSHOT.war` to Tomcat's `webapps/` directory
3. Start Tomcat server

### Environment Variables

For production deployment, use environment variables for sensitive configuration:

```bash
export DB_URL=jdbc:mysql://prod-server:3306/autonomous_dashboard
export DB_USERNAME=prod_user
export DB_PASSWORD=secure_password
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## 📝 License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## 📞 Support

For support and questions:

- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation wiki

## 🔄 Version History

- **v0.0.1-SNAPSHOT** - Initial development version
  - Basic Spring Boot setup
  - MySQL integration
  - JSP frontend support

---

**Note:** This is a development version. Please ensure proper testing before deploying to production environments.