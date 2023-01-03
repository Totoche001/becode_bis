**There is a requirement to host a set of servers in the Cloud for three months. Which of the following launch types for AWS EC2 instances would be the most cost-effective?**

* Spot Instances

Incorrect. Spot instances are cheap, but they are only for applications with flexible start and end times, Applications that are only feasible at very low compute prices, or Users with urgent computing needs for large amounts of additional capacity.

* Partial Upfront costs Reserved

Incorrect. AWS requires a minimum 1-year term on their contracts for reserved instances.

* **On-Demand**

Since the requirement is just three months, the most cost-effective option is to use On-Demand Instances.

* No Upfront costs Reserved

Incorrect. AWS requires a minimum 1-year term, and a successful billing history is needed before you can purchase No Upfront Reserved Instances.

EXPLANATION
On-Demand Pricing: https://aws.amazon.com/ec2/pricing/on-demand/

**Which of the following security features is associated with a Subnet in a VPC to protect against Incoming traffic requests.**

* **NACL**

* Subnet Groups

* AWS Inspector

Security Groups

EXPLANATION
A-network access control list (ACL)-is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC.

Network ACLs

**Which of the following is a best practice when working with permissions in AWS?**

* Ensure the highest privilege access is used

* Don’t use IAM users and groups

* **Ensure the least privilege access is used**

Use the root account credentials

EXPLANATION
When you create IAM policies, follow the standard security advice of granting-least privilege—that is, granting only the permissions required to perform a task. Determine what users need to do and then craft policies for them that let the users perform-only-those tasks.

IAM Best Practices

**Which of the following options of AWS RDS allows for AWS to failover to a secondary database in case the primary one fails?**

* AWS Failover

* AWS Standby

* AWS Secondary

* **AWS Multi-AZ**

Amazon RDS Multi-AZ deployments provide enhanced availability and durability for Database (DB) Instances, making them a natural fit for production database workloads. When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Each AZ runs on its own physically distinct, independent infrastructure, and is engineered to be highly reliable. In case of an infrastructure failure, Amazon RDS performs an automatic failover to the standby (or to a read replica in the case of Amazon Aurora), so that you can resume database operations as soon as the failover is complete.

EXPLANATION
AWS Multi-AZ: https://aws.amazon.com/rds/details/multi-az/

**You are exploring what services AWS has off-hand. You have a large number of data sets that need to be processed. Which of the following services can help fulfil this requirement.**

* Storage gateway

* **EMR**

* Glacier

* S3

EXPLANATION
Amazon EMR helps you analyze and process vast amounts of data by distributing the computational work across a cluster of virtual servers running in the AWS Cloud. The cluster is managed using an open-source framework called Hadoop. Amazon EMR lets you focus on crunching or analyzing your data without having to worry about time-consuming setup, management, and tuning of Hadoop clusters or the compute capacity they rely on.

http://docs.amazonaws.cn/en_us/aws/latest/userguide/emr.html

What is the ability provided by AWS to enable fast, easy, and secure transfers of files over long distances between your client and your Amazon S3 bucket.

* File Transfer

* HTTP Transfer

* S3 Acceleration

* **S3 Transfer Acceleration**

EXPLANATION
Amazon S3 Transfer Acceleration enables fast, easy, and secure transfers of files over long distances between your client and an S3 bucket. Transfer Acceleration takes advantage of Amazon CloudFront’s globally distributed edge locations. As the data arrives at an edge location, data is routed to Amazon S3 over an optimized network path.

Amazon S3 Transfer Acceleration

**What AWS tool lets you to view and analyze your costs and usage?**

* AWS Consolidated billing

Incorrect. AWS Consolidated Billing is for managing the billing from multiple AWS accounts.

* Payment History

Incorrect. Payment history just allows you to view your previous payments made to AWS.

* Cost Allocation Tags

Incorrect. A Cost Allocation tag is a label that you or AWS assigns to an AWS resource to help track AWS costs.

* **Cost Explorer**

Cost Explorer is a free tool that you can use to view your costs. You can view your costs as either a cash-based view (costs are recorded when cash is received or paid) with unblended costs or as an accrual-based view (costs are recorded when income is earned or costs are incurred). You can view data for up to the last 12 months, forecast how much you are likely to spend for the next three months, and get recommendations for what Reserved Instances to purchase

EXPLANATION
AWS Cost Explorer

**You have a distributed application that periodically processes large volumes of data across multiple Amazon EC2 Instances. The application is designed to recover gracefully from Amazon EC2 instance failures. How can you cost-effectively accomplish this?**

* **Spot Instances**

* Dedicated instances

* On-Demand instances

* Reserved instances

EXPLANATION
When you think of cost-effectiveness, you can either have to choose Spot or Reserved instances. When you have a regular processing job, the best is to use spot instances. Since your application is designed to recover gracefully from Amazon EC2 instance failures, even if you lose the Spot instance, there is no issue because your application can recover.

Amazon EC2 Spot Instances

**A company wants to utilize aws storage. For them low storage cost is paramount, the data is rarely retrieved, and data retrieval times of several hours are acceptable for them. What is the best storage option to use?**

* AWS Cloud Front

* EBS backed storage connected to EC2

* AWS S3 Reduced Redundancy Storage

* **AWS Glacier**

EXPLANATION
Amazon Glacier is a storage service optimized for infrequently used data, or "cold data." The service provides durable and extremely low-cost storage with security features for data archiving and backup. With Amazon Glacier, you can store your data cost effectively for months, years, or even decades.

Amazon S3 Glacier

**AWS provides a storage option known as Amazon S3 Glacier.What is this AWS service designed for? (Select 2)**

* Active database storage

* Cached session data

* **Infrequently accessed data**

* **Data archives**

EXPLANATION
Amazon Glacier is an extremely low-cost storage service that provides secure, durable, and flexible storage for data backup and archival. So Amazon glacier is used for Infrequently accessed data and Data archives.

Amazon S3 Glacier

**In order to predict the cost of moving resources from on-premise to the cloud, which of the following can be used?**

* AWS WAF

* **AWS Pricing Calculator**

* AWS Inspector

* AWS Trusted Advisor

EXPLANATION
The AWS TCO calculator makes it easy to estimate your savings when comparing the cloud to an on-premises or colocation environment. Use the TCO calculator to get detailed reports and insights into the cost components that make AWS a viable alternative to lower your costs.

Cloud Economics Center

**When using On-Demand instances in AWS, which of the following is a false statement when it comes to the cost for the Instance?**

* You pay for how much you use.

* **You have to pay the termination fees if you terminate the instance**

* You are charged per second based on the hourly rate

* You pay no upfront costs for the instance

EXPLANATION
You don’t need to pay any termination fees when it comes to Ec2 Instances

Amazon EC2 Pricing


**What AWS service has built-in DDoS mitigation?**

* CloudTrail

* EC2

* **CloudFront**

* CloudWatch

EXPLANATION
CloudFront also integrates with AWS WAF, a web application firewall that helps protect web applications from common web exploits, and AWS Shield, a managed DDoS protection service that safeguards web applications running on AWS.-

Amazon CloudFront Key Features

**Which of the following storage mechanisms can be used to store messages effectively which can be used across distributed systems.**

* Amazon EBS Snapshots

* **Amazon SQS**

* Amazon Glacier

* Amazon EBS Volumes

EXPLANATION
Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. It moves data between distributed application components and helps you decouple these components

What Is Amazon Simple Queue Service?

**Which of the following IAM identities allow an application deployed on an EC2 instance to write data to S3 in a secure manner?**

* AWS IAM Users

Incorrect. IAM users are for granting AWS access to your users. Not an EC2 instance.

* AWS IAM Groups

Incorrect. An IAM group is a collection of IAM users

* AWS IAM Permissions

Incorrect. IAM Permissions are included in a permission policy, which is then assigned to an IAM Role

* **AWS IAM Roles**

An IAM role is similar to a user, in that it is an AWS identity with permission policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it including assigning it to an EC2 instance.

EXPLANATION
Amazon IAM Roles: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html

**Which of the following is NOT a disaster recovery deployment technique.**

* Multi-Site

A multi-site solution runs in AWS as well as on your existing on-site infrastructure,in an active-active configuration. The data replication method that you employ will be determined by the recovery pointthat you choose. For more information about recovery point options, see the Recovery Time Objective and Recovery Point Objective section in this whitepaper.

* Warm standby

The term warm standby is used to describe a DR scenario in which a scaled-down version of a fully functional environment is always running in the cloud. A warm standby solution extends the pilot light elements and preparation. It further decreases the recovery time because some services are always running.

* **Single Site**

This is NOT a disaster recovery deployment technique

* Pilot light

This scenario is similar to a backup-and-restore scenario. For example, with AWS you can maintain a pilot light by configuring and running the most critical core elements of your system in AWS. When the time comes for recovery, you can rapidly provision a full-scale production environment around the critical core

EXPLANATION
New Whitepaper: Using AWS for Disaster Recovery

**You have a mission-critical application that must be globally available at all times. If this is the case, which of the below deployment mechanisms would you employ?**

* **Deployment to Multiple Regions**

* Deployment to multiple Availability Zones

* Deployment to multiple edge locations

* Deployment to multiple Data Centers

EXPLANATION
Regions represent different geographic locations and are best to host your application across multiple regions for disaster recovery.

Regions and Availability Zones

**Which of the following is not a supported database engine in the AWS Relation Database Service?**

* MySQL

* Aurora

* **DB2**

* MariaDB

EXPLANATION
Amazon RDS is available on several database instance types - optimized for memory, performance or I/O - and provides you with six familiar database engines to choose from, including-Amazon Aurora,-PostgreSQL,-MySQL,-MariaDB,-Oracle, and-Microsoft SQL Server.-

Amazon Relational Database Service (RDS)

**A company is deploying a two-tier, highly available web application to AWS. Which service provides durable storage for static content while utilizing lower Overall CPU resources for the web tier?**

* Amazon EBS volume

* Amazon EC2 instance store

* Amazon RDS instance

* **Amazon S3**

EXPLANATION
Amazon S3 is the default storage service that should be considered for companies. If provides durable storage for all static content.

Amazon S3 Frequently Asked Questions

**What are the four levels of AWS Premium Support?**

* Developer, Business, Free, Basic

* **Developer, Business, Enterprise On-Ramp, Enterprise**

Developer: Recommended if you are experimenting or testing in AWS.

Business: Minimum recommended tier if you have production workloads in AWS

Enterprise On-Ramp: Recommended if you have production and/or business critical workloads in AWS.

Enterprise: Recommended if you have business and/or mission critical workloads in AWS.

* All support is free

* Basic, Startup, Business, Enterprise

EXPLANATION
AWS Support Plan Comparison: https://aws.amazon.com/premiumsupport/compare-plans/

**Which of the following benefits would be attractive to a company moving from on-premise to AWS?**

* **Flexible**

* Control of Physical Servers

* Pay Up Front

* **Cost-Effective**

EXPLANATION
https://aws.amazon.com/application-hosting/benefits/

Easy to use

AWS is designed to allow application providers, ISVs, and vendors to quickly and securely host your applications – whether an existing application or a new SaaS-based application. You can use the AWS Management Console or well-documented web services APIs to access AWS’s application hosting platform.

Flexible

AWS enables you to select the operating system, programming language, web application platform, database, and other services you need. With AWS, you receive a virtual environment that lets you load the software and services your application requires. This eases the migration process for existing applications while preserving options for building new solutions.

Cost-Effective

You pay only for the compute power, storage, and other resources you use, with no long-term contracts or up-front commitments. For more information on comparing the costs of other hosting alternatives with AWS, see the AWS Economics Center.

Reliable

With AWS, you take advantage of a scalable, reliable, and secure global computing infrastructure, the virtual backbone of Amazon.com’s multi-billion dollar online business that has been honed for over a decade.

Scalable and high-performance

Using AWS tools, Auto Scaling, and Elastic Load Balancing, your application can scale up or down based on demand. Backed by Amazon’s massive infrastructure, you have access to compute and storage resources when you need them.

Secure

AWS utilizes an end-to-end approach to secure and harden our infrastructure, including physical, operational, and software measures. For more information, see the AWS Security Center.

**You want to monitor the CPU utilization of an EC2 resource in AWS. Which of the below services can help in this regard**

* AWS Cloudtrail

* **AWS Cloudwatch**

* AWS Trusted Advisor

* AWS Inspector

EXPLANATION
Amazon CloudWatch is a monitoring service for AWS cloud resources and the applications you run on AWS. You can use Amazon CloudWatch to collect and track metrics, collect and monitor log files, set alarms, and automatically react to changes in your AWS resources. Amazon CloudWatch can monitor AWS resources such as Amazon EC2 instances, Amazon DynamoDB tables, and Amazon RDS DB instances, as well as custom metrics generated by your applications and services, and any log files your applications generate

Amazon CloudWatch