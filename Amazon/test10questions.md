**Which of the following storage options provides the option of Lifecycle policies that can be used to move objects to archive storage?**

* Amazon Storage Gateway

* Amazon Glacier

* Amazon EBS

* **Amazon S3**

EXPLANATION
Lifecycle configuration enables you to specify the lifecycle management of objects in a bucket. The configuration is a set of one or more rules, where each rule defines an action for Amazon S3 to apply to a group of objects. These actions can be classified as follows:

Transition actions-– In which you define when objects transition to another-storage class. For example, you may choose to transition objects to the STANDARD_IA (IA, for infrequent access) storage class 30 days after creation, or archive objects to the GLACIER storage class one year after creation.

In which you specify when the objects expire. Then Amazon S3 deletes the expired objects on your behalf.

https://aws.amazon.com/s3/

**Your company is planning to host resources in the AWS Cloud. They want to use services which can be used to decouple resources hosted on the cloud. Which of the following services can help fulfil this requirement**

* AWS Glacier

* AWS EBS Snapshots

* AWS EBS Volumes

* **AWS SQS**

EXPLANATION
Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. It moves data between distributed application components and helps you decouple these components

What Is Amazon Simple Queue Service?

**Which of the following is not a category recommendation given by the AWS Trusted Advisor?**

* Fault tolerance

* **High Availability**

* Security

* Performance

* Cost Optimization

EXPLANATION
AWS Trusted Advisor

**When working with the AWS Cloud which of the following are headaches you don’t need to worry about. Choose 2 answers from the options given below.**

* **Having complete control over the physical infrastructure**

* **Upfront costs**

* Having the pay as you go model

* Having no need to worry about security

EXPLANATION
AWS physical infrastructure is one thing which you don't have to worry. It is maintained by AWS. Not having the need to pay upfront for using AWS resources.-

It will be a headache if you have your own infrastructure.

Benefits at a Glance

**Which of the below cannot be used to get data onto Amazon S3 Glacier?**

* AWS S3 Lifecycle policies

* **AWS Console**

* AWS Glacier API

* AWS Glacier SDK

EXPLANATION
The AWS Console cannot be used to upload data onto Glacier. The console can only be used to create a Glacier vault which can be used to upload the data.

Uploading an Archive in Amazon S3 Glacier

**Your company is running a database on RDS and performs read-heavy database workloads on a regular basis. Which feature of RDS would help reduce the load to the primary database instance?**

* **Read Replicas**

A read replica is a copy of your database which is kept up to date through asynchronous updates. The duplicate database is designed to only perform reads against the database freeing up your primary/source database to perform writes.

Amazon RDS Read Replicas/

* Cross Region Replication

Cross-Region Replication is a Disaster Recovery method so that in the case your region fails you have a backup of your database in another region. Since the questions is asking how to improve our load times and not how to improve the recovery of our database this makes this choice the wrong answer.

RDS does support Cross-Region Read Replicas which could be confused for Cross-Region Replication due to be similar in naming.

* Performance Insights

Performance Insights is tool to monitor analyze the performance of your RDS database. It may help you determine you should use a Read Replica but it will not directly improve performance

* Multi-AZ

Mutli-AZ is a synchronous duplicate of your database running in another Availability Zone. The purpose of a database running in Multi-AZ is in the event your first database fails you have another database instance on standby to failover to. Prior to failover you cannot access this standby database instance so Multi-AZ is will help you reduce heavy workloads.

You can run Read Replicas in combination with Multi-AZ but offloading is still in part due to Read Replica functionality.

EXPLANATION
Whenever a question about RDS is asking you about offloading think Read Replicas Read Replicas are asynchronous Multi-AZ are synchronous

You have a set of EC2 Instances hosted on the AWS Cloud. The EC2 Instances are hosting a web application. If you get a DDoS attack from the internet which of the following can help in reducing the overall threat to your EC2 Instances.

* **Usage of Network Access Control Lists**

* Usage of AWS Config

* Usage of the Internet gateway

* **Usage of Security Groups**

EXPLANATION
A security group acts as a virtual firewall for your instance to control inbound and outbound traffic

A Network Access Control List (NACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets.-

For more information on Security Groups, please refer to the following Link:

Security Groups for Your VPC

Network ACLs

**Which of the following service is most useful when a Disaster Recovery method is triggered in AWS?**

* Amazon SQS

* Amazon SNS

* **Amazon Route 53**

* Amazon Inspector

EXPLANATION
Rouet53 is a domain name system service by AWS. When a disaster does occur, it can be easy to switch to secondary sites using the Route53 service.

Amazon Route 53 is a highly available and scalable cloud-Domain Name System (DNS)-web service. It is designed to give developers and businesses an extremely reliable and cost-effective way to route end users to Internet applications by translating names like www.example.com into the numeric IP addresses like 192.0.2.1 that computers use to connect to each other. Amazon Route 53 is fully compliant with IPv6 as well

https://aws.amazon.com/route53/

**Which of the following statements are FALSE when it comes to elasticity?**

* Diverting traffic to instances based on the demand

Auto scaling policies can be triggered to create/add instances or release/remove instances based on demand

* **Diverting traffic across multiple regions**

Auto scaling groups can span across multiple Availability Zones within a Region but cannot span across multiple Regions

* Diverting traffic to instances with the least load

Auto scaling policies can be configured to route traffic to instances with the least load

* **Diverting traffic to instances with high loads**

You would not want to divert traffic to instances that already have high workloads. A good auto scaling policy would create more instances to offload traffic to instances so none of them have high workloads

EXPLANATION
The concept of Elasticity is the means of an application having the ability to scale up and scale down based on demand. An example of such a service is the Autoscaling service

AWS Auto Scaling

**Which of the following features of an Amazon VPC allows your VPC to span multiple Availability Zones?**

* Network Access Control Lists

* Subnet

A subnet must reside within a single AZ

* Route Tables

* **None of these**

EXPLANATION
By default, a VPC spans all of the Availability Zones in a Region.

Overview of VPCs and subnets