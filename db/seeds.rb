# Creates an initial admin user only for testing purposes
User.create!(email: "user_test_admin@email.com", password:"123456", role: "admin")
