# Python-OC-Lettings-FR

A Django web application for managing lettings and user profiles. This project is designed for learning and demonstration purposes, featuring a modular structure and modern deployment practices.

## Features

- User authentication and profile management
- Lettings listings and details
- Modular Django app structure

## Installation

1. **Clone the repository:**
  ```bash
  git clone https://github.com/your-username/Python-OC-Lettings-FR.git
  cd Python-OC-Lettings-FR
  ```

2. **Create and activate a virtual environment:**
  ```bash
  python -m venv venv
  source venv/bin/activate  # On Windows: venv\Scripts\activate
  ```

3. **Install dependencies:**
  ```bash
  pip install -r requirements.txt
  ```

4. **Apply migrations:**
  ```bash
  python manage.py migrate
  ```

5. **Run the development server:**
  ```bash
  python manage.py runserver
  ```

## CI/CD Pipeline

This project uses **GitHub Actions** for continuous integration and deployment:

- **CI:** On each push or pull request, GitHub Actions runs tests and lints the code.
- **Docker Build:** The app is packaged into a Docker image using the provided `Dockerfile`.
- **CD:** On push to the `main` branch, the Docker image is built and pushed to a container registry.
- **Deployment:** The latest Docker image is automatically deployed to [Render](https://render.com/).

### Example GitHub Actions Workflow

```yaml
name: CI/CD Pipeline

on:
  push:
   branches: [ main ]
  pull_request:

jobs:
  build:
   runs-on: ubuntu-latest
   steps:
    - uses: actions/checkout@v3
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
       python-version: '3.10'
    - name: Install dependencies
      run: pip install -r requirements.txt
    - name: Run tests
      run: python manage.py test

  docker:
   needs: build
   runs-on: ubuntu-latest
   steps:
    - uses: actions/checkout@v3
    - name: Build and push Docker image
      uses: docker/build-push-action@v5
      with:
       push: true
       tags: your-dockerhub-username/python-oc-lettings-fr:latest
```

## Deployment on Render

1. Connect your GitHub repository to Render.
2. Set up a new **Web Service** using the Docker image.
3. Configure environment variables as needed.
4. Render will automatically deploy the latest image on each push to `main`.

---

Feel free to contribute or open issues!