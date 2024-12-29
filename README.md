# Ecom - Spring Boot E-Commerce Application

## Overview
Ecom is a fully-featured e-commerce web application built using Spring Boot. It implements core e-commerce functionalities including user authentication, product management, shopping cart operations, and admin controls with role-based access. \
*ps : I have not made the front-end that appealing :') , but its fully functional ;)*

## Features

### User Management
- User registration and authentication
- Role-based access control (ADMIN and USER roles)
- User profile management
- User blacklisting system

### Product Management
- Product listing and details
- Product availability status
- Product CRUD operations (Admin only)
- Product search and filtering

### Shopping Cart
- Add/remove items to cart
- Update item quantities
- View cart contents
- Cart persistence across sessions

### Admin Features
- User management (view, ban/unban users)
- Product inventory management
- Access to blacklisted users
- Admin profile management

## Technology Stack

### Backend
- Java 17
- Spring Boot
- Spring Security
- Spring Data JPA
- Hibernate
- BCrypt Password Encryption

### Database
- JPA/Hibernate for ORM
- Compatible with any JPA-supported database (MySQL, PostgreSQL, etc.)

### Frontend
- JSP (JavaServer Pages)
- HTML/CSS
- Bootstrap (assumed based on the structure)

## Project Structure

```
+---src
¦   +---main
¦   ¦   +---java
¦   ¦   ¦   +---org
¦   ¦   ¦       +---keval
¦   ¦   ¦           +---ecom
¦   ¦   ¦               ¦   EcomApplication.java
¦   ¦   ¦               ¦   
¦   ¦   ¦               +---config
¦   ¦   ¦               ¦       SecurityConfig.java
¦   ¦   ¦               ¦       
¦   ¦   ¦               +---controller
¦   ¦   ¦               ¦       AdminController.java
¦   ¦   ¦               ¦       AuthController.java
¦   ¦   ¦               ¦       CustomerController.java
¦   ¦   ¦               ¦       ItemController.java
¦   ¦   ¦               ¦       
¦   ¦   ¦               +---model
¦   ¦   ¦               ¦       Blacklist.java
¦   ¦   ¦               ¦       Cart.java
¦   ¦   ¦               ¦       Customer.java
¦   ¦   ¦               ¦       CustomerPrincipal.java
¦   ¦   ¦               ¦       Items.java
¦   ¦   ¦               ¦       Role.java
¦   ¦   ¦               ¦       
¦   ¦   ¦               +---repo
¦   ¦   ¦               ¦       BlacklistRepo.java
¦   ¦   ¦               ¦       CartRepo.java
¦   ¦   ¦               ¦       CustomerRepo.java
¦   ¦   ¦               ¦       ItemRepo.java
¦   ¦   ¦               ¦       
¦   ¦   ¦               +---service
¦   ¦   ¦                       BlacklistService.java
¦   ¦   ¦                       CartService.java
¦   ¦   ¦                       CustomerService.java
¦   ¦   ¦                       ItemService.java
¦   ¦   ¦                       
¦   ¦   +---resources
¦   ¦   ¦   ¦   application.properties
¦   ¦   ¦   ¦   
¦   ¦   ¦   +---static
¦   ¦   ¦   ¦       ecom.jpg
¦   ¦   ¦   ¦       
¦   ¦   ¦   +---templates
¦   ¦   +---webapp
¦   ¦       +---META-INF
¦   ¦           +---jsp
¦   ¦                   addItems.jsp
¦   ¦                   AdminPortal.jsp
¦   ¦                   Blacklist.jsp
¦   ¦                   EditAdmin.jsp
¦   ¦                   EditUser.jsp
¦   ¦                   error.jsp
¦   ¦                   home.jsp
¦   ¦                   ItemEditor.jsp
¦   ¦                   login.jsp
¦   ¦                   ManageItems.jsp
¦   ¦                   register.jsp
¦   ¦                   UserList.jsp
¦   ¦                   UserPortal.jsp
¦   ¦                   ViewCart.jsp
¦   ¦                   ViewItems.jsp
¦   ¦                   
¦   +---test
¦       +---java
¦           +---org
¦               +---keval
¦                   +---ecom
¦                           EcomApplicationTests.java
¦                           
+---target
    +---classes
    ¦   ¦   application.properties
    ¦   ¦   
    ¦   +---org
    ¦   ¦   +---keval
    ¦   ¦       +---ecom
    ¦   ¦           ¦   EcomApplication.class
    ¦   ¦           ¦   
    ¦   ¦           +---config
    ¦   ¦           ¦       SecurityConfig.class
    ¦   ¦           ¦       
    ¦   ¦           +---controller
    ¦   ¦           ¦       AdminController.class
    ¦   ¦           ¦       AuthController.class
    ¦   ¦           ¦       CustomerController.class
    ¦   ¦           ¦       ItemController.class
    ¦   ¦           ¦       
    ¦   ¦           +---model
    ¦   ¦           ¦       Blacklist.class
    ¦   ¦           ¦       Cart.class
    ¦   ¦           ¦       Customer.class
    ¦   ¦           ¦       CustomerPrincipal.class
    ¦   ¦           ¦       Items.class
    ¦   ¦           ¦       Role.class
    ¦   ¦           ¦       
    ¦   ¦           +---repo
    ¦   ¦           ¦       BlacklistRepo.class
    ¦   ¦           ¦       CartRepo.class
    ¦   ¦           ¦       CustomerRepo.class
    ¦   ¦           ¦       ItemRepo.class
    ¦   ¦           ¦       
    ¦   ¦           +---service
    ¦   ¦                   BlacklistService.class
    ¦   ¦                   CartService.class
    ¦   ¦                   CustomerService.class
    ¦   ¦                   ItemService.class
    ¦   ¦                   
    ¦   +---static
    ¦           ecom.jpg
    ¦           


```

## Setup and Installation

### Prerequisites
1. Java 17 or higher
2. Maven
3. Your preferred IDE (IntelliJ IDEA recommended)
4. MySQL or any other compatible database

### Steps to Run

1. Clone the repository:
```bash
git clone [repository-url]
cd ecom
```

2. Configure database connection in `application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/ecom_db
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

3. Create the database:
```sql
CREATE DATABASE ecom_db;
```

4. Build the project:
```bash
mvn clean install
```

5. Run the application:
```bash
mvn spring-boot:run
```

The application will be available at `http://localhost:8080`

## Initial Setup

### Creating an Admin User
You can create an admin user by directly inserting into the database:

```sql
INSERT INTO customer (name, email, password, role)
VALUES ('Admin', 'admin@ecom.com', '[bcrypt-encoded-password]', 'ROLE_ADMIN');
```

Note: Use BCryptPasswordEncoder to generate the password hash.

## Usage

### User Functions
1. Register a new account
2. Login with credentials
3. Browse products
4. Add products to cart
5. Manage cart
6. Update profile

### Admin Functions
1. Login with admin credentials
2. Manage products (add/edit/delete)
3. View all users
4. Ban/unban users
5. View blacklisted users
6. Edit admin profile

## Security Features

- Session management
- CSRF protection (disabled for this implementation)
- Password encryption using BCrypt
- Role-based access control
- Blacklist system for banned users

## API Endpoints

### Authentication
- GET `/login` - Login page
- POST `/auth` - Authentication endpoint
- GET `/logout` - Logout
- POST `/register` - User registration
- GET `/register` - Registration page

### User Operations
- GET `/user/portal` - User dashboard
- GET `/user/cart` - View cart
- POST `/user/buyItem` - Add to cart
- POST `/user/adds` - Update cart quantity
- POST `/user/remove` - Remove from cart
- GET `/user/edit` - Edit profile page
- POST `/user/edit` - Update profile

### Admin Operations
- GET `/admin/portal` - Admin dashboard
- POST `/admin/addItem` - Add new product
- GET `/admin/users` - View all users
- GET `/admin/ban` - Ban user
- GET `/admin/unban` - Unban user
- GET `/admin/blacklist` - View blacklisted users
- GET `/admin/manage` - Manage products
- GET `/admin/editItem` - Edit product page
- POST `/admin/editIt` - Update product
- GET `/admin/deleteItem` - Delete product

## Contributing
Please follow these steps for contributing:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License
[MIT License](https://github.com/aftermath22/Ecom?tab=MIT-1-ov-file#)
