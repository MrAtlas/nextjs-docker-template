# Next.js + Docker Boilerplate

This is a simple boilerplate for quickly starting a Next.js project with Docker support. It provides a streamlined setup process for containerized development and deployment.

---

## Features

- Next.js 14+
- Tailwind CSS for styling
- Docker support for containerized deployment
- Simple, clean structure for quick project initialization

---

## Getting Started

### Prerequisites

1. **Install [Node.js](https://nodejs.org/)**
   Ensure you have Node.js installed for managing dependencies.

2. **Install [Docker](https://www.docker.com/)**
   Docker is required to build and run the containerized application.

---

### Steps to Use

#### 1. Clone the Repository

git clone https://github.com/your-username/nextjs-docker-boilerplate.git
cd nextjs-docker-boilerplate

2. Install Dependencies
bash

npm install
3. Build Your Docker Container
bash

docker build -t nextjs-docker .
4. Run Your Docker Container
bash

docker run -p 3000:3000 nextjs-docker
5. Access the App
The app will be running at:



http://localhost:3000
Project Structure


.
├── Dockerfile           # Docker configuration
├── package.json         # Project dependencies
├── pages                # Next.js pages
├── public               # Public assets
├── styles               # Tailwind CSS and other styles
└── README.md            # Documentation

Dockerfile
Here's the Dockerfile used in this project for reference:

dockerfile

# Use Node.js as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the app on port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
Environment Variables
You can configure environment variables by creating a .env.local file in the root directory:

plaintext


# Example variables
NEXT_PUBLIC_API_URL=http://localhost:3000/api
Contributing
Feel free to open an issue or submit a pull request for any improvements or suggestions.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Author
MrAtlas

javascript
