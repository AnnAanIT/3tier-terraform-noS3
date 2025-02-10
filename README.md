
Thông tin chi tiết về các service:

1. **Network (10.0.0.0/16)**:
   - Public Subnets: 10.0.1.0/24, 10.0.2.0/24
   - Private App Subnets: 10.0.3.0/24, 10.0.4.0/24
   - Private DB Subnets: 10.0.5.0/24, 10.0.6.0/24

2. **Internet Gateway**:
   - Public access
   - Routes traffic to ALB
   - Located in public subnet

3. **Application Load Balancer**:
   - Port 80 (HTTP)
   - Forwards to EC2 instances
   - Health checks enabled
   - Located in public subnet

4. **NAT Gateway**:
   - Located in public subnet
   - Enables outbound internet for EC2s
   - Elastic IP assigned

5. **EC2 Instances**:
   - Instance Type: t2.micro
   - Located in private subnets
   - Frontend port: 3000
   - Backend port: 8080
   - Docker installed
   - Auto Scaling: 2-4 instances

6. **RDS MySQL**:
   - Instance Class: db.t3.micro
   - Storage: 20GB gp2
   - Located in private subnet
   - Backup retention: 7 days
   - Maintenance window: Mon 04:00-05:00
   - Backup window: 03:00-04:00

7. **Security Groups**:
   - ALB: Inbound 80 from anywhere
   - EC2: Inbound 3000, 8080 from ALB
   - RDS: Inbound 3306 from EC2 only

8. **High Availability**:
   - Multi-AZ deployment
   - Resources across 2 AZs
   - Auto Scaling enabled
  
   ![image](https://github.com/user-attachments/assets/941ceacf-9f00-41b2-a777-1c50d4f546a3)
