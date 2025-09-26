# Launch-Website-On-AWS-By-Using-Terraform
# Launch Website on AWS using Terraform

This project demonstrates how to deploy a **static website** on **Amazon S3** using **Terraform**.

It will:
- Create an S3 bucket for website hosting
- Upload local files (`index.html`, `style.css`)
- Configure bucket policy for public access
- Output the website endpoint

---

## 🚀 Prerequisites

- AWS Account with programmatic access
- Terraform installed → [Download Terraform](https://developer.hashicorp.com/terraform/downloads)
- Git installed

---

## 🛠 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/AbdullahZaheer1/Launch-Website-On-AWS-By-Using-Terraform.git
cd Launch-Website-On-AWS-By-Using-Terraform
```



### 2. Configure AWS Credentials
Create a .env file in the root directory:
```bash
vim .env
```
Add the following lines (replace with your credentials):

```bash
export AWS_ACCESS_KEY_ID=<your-access-key>
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
export AWS_REGION=eu-north-1
```
Load the file:
```bash
source .env
```

### 3. Initialize Terraform
```bash
terraform init
```
### 4. Validate the Configuration
```bash
terraform validate
```
### 5. Plan the Infrastructure
```bash
terraform plan
```
### 6. Apply the Configuration
```bash
terraform apply
```

### 7. 🌐 Access Your Website
After applying, Terraform will show the S3 website endpoint:
```bash
Outputs:

website_endpoint = http://my-website-xxxx.s3-website.eu-north-1.amazonaws.com
```
Open this URL in your browser.

<hr>

## 🧹 Clean Up (Destroy Resources)
```bash
terraform destroy
```

## 📂 Project Structure
```bash
.
├── main.tf          # Terraform resources (S3, bucket policy, uploads)
├── .env             # AWS Environment Variable
├── index.html       # Index file
├── style.css        # CSS file
```
