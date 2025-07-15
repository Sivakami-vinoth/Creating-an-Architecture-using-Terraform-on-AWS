# Creating-an-Architecture-using-Terraform-on-AWS

You work as a DevOps Engineer in a leading software company. You have been asked to build an infrastructure safely and efficiently. 

## The company’s requirements: 

1. Use AWS Cloud Provider and the software to be installed is Apache2 
2. Use Ubuntu AMI

**The company wants the architecture to have the following services:**

1. Create a template with a VPC, 2 subnets and 1 instance in each subnet 
2. Attach security groups, internet gateway and network interface to the instance 

---------------------------------------------------------------------------------------------------------

## Step:1 Create an EC2 Instances my-machine manually

**Login to AWS Console using your credentials**

**My-machine: OS-> ubuntu, Instance type-> t2.medium**

<img width="602" height="78" alt="image" src="https://github.com/user-attachments/assets/71f9a000-131c-4cec-a9d6-f7ac58c126e7" />

**Connect to the instance via mobaxterm**

<img width="602" height="360" alt="image" src="https://github.com/user-attachments/assets/60185104-ed5a-4989-89e1-f223c7f2050f" />

## Step:2 Intsall Terrform in Machine-1

**Open the link -> Install | Terraform | HashiCorp Developer**

<img width="602" height="202" alt="image" src="https://github.com/user-attachments/assets/af57c4ee-4858-4376-a19e-5adb391c4f7e" />

**Copy and Run the commands**

<pre>
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
Terraform Installed successfully
</pre>

<img width="409" height="79" alt="image" src="https://github.com/user-attachments/assets/f1b994a9-ae98-4cba-915b-2f0d8368c883" />

## Step:3 Create terraform files
**(To create a VPC,  subnets and EC2 instance. Attach security groups, internet gateway and network interface to the instance)**

**Create the access keys -> open AWS console-> IAM**

**(save the access key and secret key in your laptop)**

<img width="602" height="196" alt="image" src="https://github.com/user-attachments/assets/cb43b6d0-b979-4155-84c9-d3fac9de1ed4" />

**Create variable.tf to pass the secret keys** (refer variable.tf file for code )

**create main.tf to create the required resources in the aws console** (refer main.tf file for code)

**Run -> terraform init (to initialize the terraform )**

<img width="602" height="358" alt="image" src="https://github.com/user-attachments/assets/2d5ec2da-0e5e-4f88-b8b4-abf66b269c56" />

**Run-> terraform plan (to verify the execution plan)**

<img width="602" height="233" alt="image" src="https://github.com/user-attachments/assets/82c24325-3d8e-4f11-8eb5-50d5d2817d3d" />

<img width="602" height="85" alt="image" src="https://github.com/user-attachments/assets/a7d96fb7-2590-4034-a4cd-3858236d365e" />

**Run -> terraform apply \ -var="aws_access_key=YOUR_ACCESS_KEY" \ -var="aws_secret_key=YOUR_SECRET_KEY"**

<img width="602" height="147" alt="image" src="https://github.com/user-attachments/assets/7f48f349-7970-423a-b5b5-71ac5b5088c5" />

<img width="602" height="322" alt="image" src="https://github.com/user-attachments/assets/726743ae-4dc3-408f-873a-70e70a5e646c" />

**Successfully created the VPC, Subnet ,Security groups,Internet gateway and network interface**

**VPC created**

<img width="602" height="85" alt="image" src="https://github.com/user-attachments/assets/9d50464a-e5d4-46f0-830c-86a46159aaaa" />

<img width="602" height="230" alt="image" src="https://github.com/user-attachments/assets/6200d4eb-8744-4cd0-b010-f8814fc493bd" />

**Subnet created**

<img width="602" height="62" alt="image" src="https://github.com/user-attachments/assets/2f48f305-bab9-41a7-9a44-21206ac3ac18" />

**Route table created**

<img width="602" height="60" alt="image" src="https://github.com/user-attachments/assets/9a2935e9-c7a3-4158-8832-7328f24b217a" />

**Security group created**

<img width="602" height="69" alt="image" src="https://github.com/user-attachments/assets/552c8ef7-c324-4942-ad1f-34790ee042ee" />

**Internet gateway created**

<img width="602" height="74" alt="image" src="https://github.com/user-attachments/assets/169c8c66-d4b2-4122-a476-dd44afbb21fb" />

**Network interface created**

<img width="602" height="70" alt="image" src="https://github.com/user-attachments/assets/7d6117ab-eeda-4d1d-b84a-e503b60d46a5" />

**Internet gateway attached to the route table**

<img width="602" height="288" alt="image" src="https://github.com/user-attachments/assets/fe199e93-896d-401c-81a2-cf2db2deb04f" />

**Subnet association done**

<img width="602" height="95" alt="image" src="https://github.com/user-attachments/assets/d4abd5a5-1a47-488b-a1fa-50df031a82a3" />

**Instance created successfully**

<img width="602" height="277" alt="image" src="https://github.com/user-attachments/assets/8f58dabd-09c1-4c61-8d7e-7547a275b964" />

**Web server installed successfully**

<img width="602" height="294" alt="image" src="https://github.com/user-attachments/assets/fe310de5-0537-4bca-a82c-c302ebc687b8" />


















