# 🚗 Driver Management Application

A Ruby on Rails web application for logging driver clock-in/out times and managing tasks efficiently.

## Features

- ⏰ **Driver Clock-In/Out Tracking**: Monitors and records driver working hours.
- 📋 **Task Management**: Create, assign, and track tasks.

## Getting Started

### 🛠️ Requirements

Ensure you have the following installed:

- **Ruby**: Version `ruby 3.3.5` or higher. Check with:

  ```bash
  ruby -v

  Rails 7.2.1
  Node.js  v20.17.0
📦 Installation

  Clone the Repository
  git clone https://github.com/M1ngos/driver-management-app.git
  cd driver-management-app

  Install Dependencies
  bundle install  
  rails db:create
  rails db:seed
  
🧪 Running Tests
    rails test

⚙️ Services

🚀 Deployment
  heroku create
  git push heroku main
  heroku run rails db:migrate
  heroku config:set RAILS_ENV=production





