**Which services allow the customer to retain full administrative privileges of the underlying virtual infrastructure?**

* **Amazon EC2**
* Amazon DynamoDB
* Amazon Lambda
* Amazon S3

EXPLANATION
All of the other services are all managed by AWS as serverless components. Only you have complete control over the EC2 service.

Amazon EC2

**An organization wants to build their next web application on AWS. They have decided they should begin the project by purchasing a domain name and then pointing the domain to a static website hosted on S3.Which AWS Service can be used to purchase and manage their domain name records?**

* AWS DNS

DNS stands from Domain Name Service. AWS does not have a service by this name.

* You cannot purchase domain names on AWS. Use a third-party service like GoDaddy Let AWS manage the domain

This is not true, AWS Route53 can be used to purchase domain names.

* **Amazon Route53**

Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. You can use Route 53 to perform three main functions in any combination: domain registration, DNS routing, and health checking.

https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html

* Amazon CloudFront

CloudFront is Content Distribution Network (CDN) Its not used for purchasing or managing domain names.

**Which AWS Load Balancer service uses a simple Round Robin load distribution for HTTP/HTTPS requests?**

* Application Load Balancer

* **Classic Load Balancer**

EXPLANATION
The Classic Load Balancer is used for simple Round Robin.

**Which of the following AWS services should you use to migrate an existing database to AWS?**

* **AWS DMS**

* AWS Lambda

* AWS Snowball

* AWS Storage gateway

EXPLANATION
AWS Database Migration Service helps you migrate databases to AWS quickly and securely. The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database. The AWS Database Migration Service can migrate your data to and from most widely used commercial and open-source databases.

AWS Database Migration Service

**Which AWS service is designed to store data as objects?**

* Amazon EBS

EBS is Elastic Block Storage. It allows you to attach multiple virtual hard drives of either SSD or HHD to EC2 instances. Data is store as files via file system controlled by the OS. The goal behind object storage is you don't have to worry about file systems, OS, drive type which are options you have to choose with block storage.

* **Amazon S3**

Amazon Simple Storage Service (S3) is an object store where you don't have to worry about OS, drive type, file system. You just upload files and S3 automatically replicates your files across multiple availability zones and rour files will be highly available and durable with no configuration required.

S3

* SQS

Amazon SQS is Simple Queue Service. This service does not relate to storage of data but allows apps to coordinate jobs between each other by placing messages into a queue.

* SNS

Amazon SNS is Simple Notification Service. This service does not relate to storage of data but is for notifying subscribers of SNS topics through multiple means such as email, text message or http.

EXPLANATION
Amazon S3 is-object storage-built to store and retrieve any amount of data from anywhere – web sites and mobile apps, corporate applications, and data from IoT sensors or devices. It is designed to deliver 99.999999999% durability, and stores data for millions of applications used by market leaders in every industry.

https://aws.amazon.com/s3/

**A large accounting firm wants to utilize AWS to store customer accounting information in archive storage and must store this information for seven years due to regulatory compliance.Which AWS service will meet this requirement?**

* Snowball

* **Glacier**

S3 Glacier is cold storage for archival long terms storage. It is the cheapest storage tier or S3.

You can set a Glacier Vault Policy to ensure files are not deleted for seven years.

https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html

* S3 Infrequent access

* Amazon Elastic Block Store

* AWS Backup

**Which AWS service is a message queue service used by applications to exchange messages through a polling model and can be used to decouple sending and receiving components?**

* SES

Simple Email Service is for transactional emails.

* Kinesis

This is used for application integration but its a streaming service.

* **SQS**

A system that pushes and polls messages implies a queueing service. SQS is a queueing service.

Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. SQS eliminates the complexity and overhead associated with managing and operating message-oriented middleware, and empowers developers to focus on differentiating work. Using SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available

* SNS

This is used for application integration but it's a pub/sub notification service.

EXPLANATION
Application Integration is a cloud term that is a service or software designed to help multiple services talk to each other. Sometimes they will say application integration, or they will talk about decoupling.

Types of systems for decoupling would be: - queueing - AWS SQS - streaming - Amazon Kinesis - pub/sub -AmazonSES

**You have a set of developers that need to use .NET to call AWS Services. Which of the following tools can be used to achieve this purpose?**

* AWS IAM

* AWS Console

* AWS CLI

* **AWS SDK**

EXPLANATION
The AWS SDK can be plugged in for various programming languages. Using the SDK you can then call the required AWS services.

Tools for Amazon Web Services

**Which AWS Cloud service helps in quick deployment of resources which can make use of different programming languages such as .Net and Java?**

* **AWS Elastic Beanstalk**

* AWS Elastic Compute Cloud (Amazon EC2)

* AWS SQS

* AWS VPC

EXPLANATION
AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

AWS Elastic Beanstalk

**Which of the following is the document used to grant permissions to users, groups, and roles?**

* **Policy**

* Paradigm

* Passbook

* Protocol

EXPLANATION
A Policy is the document used to grant permissions to users, groups, and roles.

**Which of the following storage mechanisms can be used to store messages effectively which can be used across distributed systems.**

* Amazon EBS Snapshots

* **Amazon SQS**

* Amazon Glacier

* Amazon EBS Volumes

EXPLANATION
Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly-scalable hosted queue for storing messages as they travel between applications or microservices. It moves data between distributed application components and helps you decouple these components

What Is Amazon Simple Queue Service?

**A company is deploying a three-tier, highly available web application to AWS. Which service provides durable storage for static content while utilizing lower Overall CPU resources for the Business layer?**

* Amazon EBS volume

* Amazon EC2 Instance Store

* **Amazon S3**

Amazon S3 is the default storage service that should be considered for companies. If provides durable storage for all static content.

https://aws.amazon.com/s3/

* Amazon RDS Instance

RDS is not appropriate for static content

**A developer needs to block specific IP addresses from reaching an EC2 instance.Which AWS Networking component can meet this requirements?**

* IAM Policy

IAM Policies do not act as virtual firewalls for VPCs

* **NACLs**

NACLs can have both ALLOW or DENY rules.

* AWS IP Block

No such service. Would it be nice though?

* ACLs

Access Control Lists is a generic term and doesn't mean anything here. Network Access Control Lists (NACLs) is a VPC networking component.

* Security Groups

Security Groups only let you use ALLOW rules meaning that Security Groups by default DENY all addresses and ports.

You'd have to create ALLOW rules for the rest of the internet and exclude the one IP address. This would not be feasible.

**AWS provides a storage option known as Amazon S3 Glacier.What is this AWS service designed for? (Select 2)**

* Active database storage

* Cached session data

* **Infrequently accessed data**

* **Data archives**

EXPLANATION
Amazon Glacier is an extremely low-cost storage service that provides secure, durable, and flexible storage for data backup and archival. So Amazon glacier is used for Infrequently accessed data and Data archives.

Amazon S3 Glacier

**Which AWS services can be used to store files**

* AWS Config

AWS Config is used to audit and monitor configuration changes.

* Amazon Athena

Amazon Athena is a serverless query service used to analyze BigData stored in S3.

* Amazon CloudWatch

Amazon CloudWatch is used for performance monitoring.

* **Amazon Simple Storage Service (Amazon S3)**

Amazon S3 is-object storage-built to store and retrieve any amount of data from anywhere – web sites and mobile apps, corporate applications, and data from IoT sensors or devices. It is designed to deliver 99.999999999% durability, and stores data for millions of applications used by market leaders in every industry.-

https://aws.amazon.com/s3/

* **Amazon Elastic Block Store (Amazon EBS)**

SELECTED
Amazon Elastic Block Store (Amazon EBS) provides persistent block storage volumes for use with-Amazon EC2-instances in the AWS Cloud. Each Amazon EBS volume is automatically replicated within its Availability Zone to protect you from component failure, offering high availability and durability.

https://aws.amazon.com/ebs/

**Which Global Infrastructure component best describes a physical location around the world where AWS clusters data centers?**

* **Region**

AWS has the concept of a Region, which is a physical location around the world where we cluster data centers. We call each group of logical data centers an Availability Zone. Each AWS Region consists of multiple, isolated, and physically separate AZs within a geographic area. Unlike other cloud providers, who often define a region as a single data center, the multiple AZ design of every AWS Region offers advantages for customers. Each AZ has independent power, cooling, and physical security and is connected via redundant, ultra-low-latency networks. AWS customers focused on high availability can design their applications to run in multiple AZs to achieve even greater fault-tolerance. AWS infrastructure Regions meet the highest levels of security, compliance, and data protection.

AWS provides a more extensive global footprint than any other cloud provider, and to support its global footprint and ensure customers are served across the world, AWS opens new Regions rapidly. AWS maintains multiple geographic Regions, including Regions in North America, South America, Europe, China, Asia Pacific, South Africa, and the Middle East.

* AWS Local Zone

AWS Local Zones place compute, storage, database, and other select AWS services closer to end-users. With AWS Local Zones, you can easily run highly-demanding applications that require single-digit millisecond latencies to your end-users such as media & entertainment content creation, real-time gaming, reservoir simulations, electronic design automation, and machine learning.

Each AWS Local Zone location is an extension of an AWS Region where you can run your latency sensitive applications using AWS services such as Amazon Elastic Compute Cloud, Amazon Virtual Private Cloud, Amazon Elastic Block Store, Amazon File Storage, and Amazon Elastic Load Balancing in geographic proximity to end-users. AWS Local Zones provide a high-bandwidth, secure connection between local workloads and those running in the AWS Region, allowing you to seamlessly connect to the full range of in-region services through the same APIs and tool sets.

* Availability Zone

An Availability Zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity in an AWS Region. AZs give customers the ability to operate production applications and databases that are more highly available, fault tolerant, and scalable than would be possible from a single data center. All AZs in an AWS Region are interconnected with high-bandwidth, low-latency networking, over fully redundant, dedicated metro fiber providing high-throughput, low-latency networking between AZs. All traffic between AZs is encrypted. The network performance is sufficient to accomplish synchronous replication between AZs. AZs make partitioning applications for high availability easy. If an application is partitioned across AZs, companies are better isolated and protected from issues such as power outages, lightning strikes, tornadoes, earthquakes, and more. AZs are physically separated by a meaningful distance, many kilometers, from any other AZ, although all are within 100 km (60 miles) of each other.

* Edge Location

An Edge Location is a Point of Presence (PoP) that acts as an entry into the AWS Network. An Edge Location is a data center that can store limited compute or cached assets near the end-user.

https://aws.amazon.com/cloudfront/features/?p=ugi&l=na&whats-new-cloudfront.sort-by=item.additionalFields.postDateTime&whats-new-cloudfront.sort-order=desc

EXPLANATION
https://aws.amazon.com/about-aws/global-infrastructure/regions_az/

**Which of the below mentioned services is equivalent to hosting virtual servers on an on-premises location?**

* AWS Regions

* **AWS EC2**

* AWS Server

* AWS IAM

EXPLANATION
Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

https://aws.amazon.com/ec2/

**An enterprise is evaluating whether to adopt AWS to offload most of their on-premise Virtual Machines to Ec2. The enterprise does not have much domain expertise and they need a point of contact that will help proactivity manage their account and connect them with AWS experts.Which Enterprise offering does this best describe?**

* Concierge Support Team

Concierge Support Team are billing and account experts working with enterprises. The question is asking for technical help, this would be designated to the TAM.

* Werner Hans Peter Vogels

Werner Hans Peter Vogels is the Chief Technical Officer of AWS. While he would be knowledgeable, his daily duties do not include doing 1-ot-1 support for Enterprises.

https://en.wikipedia.org/wiki/Werner_Vogels

* AWS Technical Support

Technically you could use Technical Support, but a TAM would be better suited for this use case.

* **TAM**

Designated Technical Account Manager (TAM) to proactively monitor your environment and assist with optimization and coordinate access to programs and AWS experts

https://aws.amazon.com/premiumsupport/plans/

**Which service allows an administrator to create and modify AWS user permissions?**

* AWS Cloud Trail

* AWS Key Management Service (AWS KMS)

* AWS Config

* **AWS Identity and Access Management (IAM)**

AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

http://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

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

**A company must securely transfer 6 terabytes to AWS from their on-premise environment.Which AWS transfer storage should best meet this requirement?**

* **AWS Snowcone**

Snowcone is for 8TB or less of data.

* AWS Storage Gateway

AWS Storage Gateway is for backing up a local drive or extending a local drive to the cloud. AWS Storage Gateway is not a data transfer account

* AWS S3

AWS S3 is possibly where the customer will want to store their data. For data transfer, it's possible to paralyze uploads and use multi-part upload, but this would not be quick at all.

* AWS Snowball

* AWS Glue

AWS Glue is a serverless data integration service that makes it easy to discover, prepare, and combine data for analytics, machine learning, and application development. AWS Glue provides all the capabilities needed for data integration so that you can start analyzing your data and putting it to use in minutes instead of months.

https://aws.amazon.com/glue/

EXPLANATION
Read about the AWS Snow Family https://aws.amazon.com/snow/

Specifically, read about the Feature comparison.

Storage breakdown:

8TB - AWS Snowcone
80TB - AWS Snowball Edge Storage Optimized 42TB - AWS Snowball Edge Compute Optimized
100PB - AWS Snowmobile

**A Canadian company needs to meet regulatory compliance where the data must reside within Canada. Their CIO has experience with maintaining and trusting on-premise infrastructure because it provides a guarantee of Data sovereignty. However, they would like to use an AWS service to take care of this for them.Which AWS service provides a guarantee of Data sovereignty?**

* AWS Data Lake

A data lake is a centralized repository that allows you to store all your structured and unstructured data at any scale. You can store your data as-is, without having to first structure the data, and run different types of analytics—from dashboards and visualizations to big data processing, real-time analytics, and machine learning to guide better decisions.

A data lake provides no guarantee of Data sovereignty

https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/

* **AWS Outposts**

https://aws.amazon.com/blogs/apn/embrace-data-sovereignty-and-low-latency-in-building-a-trusted-data-lake-with-aws-outposts-and-talend/ https://aws.amazon.com/outposts/faqs/ https://aws.amazon.com/outposts/

AWS Outposts is a fully managed service that offers the same AWS infrastructure, AWS services, APIs, and tools to virtually any datacenter, co-location space, or on-premises facility for a truly consistent hybrid experience.

AWS Outposts can guarantee Data sovereignty because the data will be running physical servers within your own on-premise environment.

Another way to apply Data sovereignty is through IAM policies, AWS Organization Service Control Policies, and Permission Boundaries. But there is always a chance of misconfiguration.

* AWS Artifact

No cost, self-service portal for on-demand access to AWS’ compliance reports

https://aws.amazon.com/artifact/

* AWS Security Hub

AWS Security Hub is a cloud security posture management service that performs security best practice checks, aggregates alerts, and enables automated remediation.

https://aws.amazon.com/security-hub/

* AWS Data Sovereignty

There is no such service.

**How can you protect your AWS account against unauthorized access?**

* Set up a secondary password

This will not increase security and may decrease it.

* Disable AWS console access

The AWS account can still be comprised by the API and the SDK.

* Request root access privileges

Overuse of root access will decrease security and not increase it.

* **Apply Multi-Factor Authentication (MFA)**

AWS Multi-Factor Authentication (MFA) is a simple best practice that adds an extra layer of protection on top of your user name and password.

https://aws.amazon.com/iam/details/mfa/

**A customer has data that resides within an Amazon S3 Bucket.Who is responsible for ensuring that the data has Server Side Encryption?**

* AWS is responsible

AWS is responsible for the Physical Servers, Physical Networking, Data Centers, Global Infrastructure. It varies based on service.

For example:

A Bare Metal server allows the customer to configure the hypervisor so the customer is responsible.

An Ec2 server does not allow the customer to configure the hypervisor so AWS is responsible.

* **The customer is responsible**

The customer is responsible because they need to configure SSE to be turned on. The customer is responsible for their data and configuration.

EXPLANATION
Refer to the AWS Shared Responsibility Model

https://aws.amazon.com/compliance/shared-responsibility-model/

**Which AWS Managed Job Function provides full access to AWS services and resources, but does not allow management of Users and groups?**

* SystemAdministrator

Grants full access permissions necessary for resources required for application and development operations.

* ViewOnlyAccess

This policy grants permission to view resources and basic metadata across all AWS services

* AdministratorAccess

Provides full access to AWS services and resources.

* **PowerUserAccess**

Provides full access to AWS services and resources, but does not allow management of Users and groups.

EXPLANATION
https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html

AdministratorAccess - Provides full access to AWS services and resources.
Billing - Grants permissions for billing and cost management. This includes viewing account usage and viewing and modifying budgets and payment methods.
DatabaseAdministrator - Grants full access permissions to AWS services and actions required to set up and configure AWS database services.
DataScientist - Grants permissions to AWS data analytics services
NetworkAdministrator - Grants full access permissions to AWS services and actions required to set up and configure AWS network resources
PowerUserAccess - Provides full access to AWS services and resources, but does not allow management of Users and groups.
SecurityAudit - The security audit template grants access to read security configuration metadata. It is useful for software that audits the configuration of an AWS account.
SupportUser - This policy grants permissions to troubleshoot and resolve issues in an AWS account. This policy also enables the user to contact AWS support to create and manage cases
SystemAdministrator - Grants full access permissions necessary for resources required for application and development operations.
ViewOnlyAccess - This policy grants permissions to view resources and basic metadata across all AWS services

**The customer is responsible for security in the cloud.**

* False

* **True**

EXPLANATION
Customers are responsible for security in the cloud.

AWS is responsible for the security of the cloud.

**A company has an EC2 instance running and suddenly the server was terminated. It's suspected that a junior developer may have terminated this instance by mistake.Which AWS service will help determining who was responsible?**

* AWS Inspector

AWS Inspector is for generating a pdf report of security vulnerabilities and best practice that should be implemented on an EC2 instance. Its can not determine who erroneously terminated an EC2 instance

* **CloudTrail**

CloudTrail logs who made what calls to services via console or through the API. CloudTrail will tell us which user account terminated the EC2 instance.

AWS CloudTrail

* CloudWatch Logs

CloudWatch does not log who does what but logs generally performance metrics of EC2 instances and other various servers. It will not be able to determine who erroneously terminated an EC2 instance

* Trusted Advisor

Trusted advisor advises you on cost optimization, performance, security, fault tolerance and service limits. It can not determine who terminated who erroneously terminated an EC2 instance

EXPLANATION
Whenever you need to assign blame, think of CloudTrail

**Your company is planning to host a large eCommerce application on the AWS Cloud. One of their major concerns is Internet attacks such as DDoS attacks. Which of the following services can help mitigate this concern.**

* AWS EC2

* AWS Config

* **AWS Shield**

* **Cloudfront**

EXPLANATION
One of the first techniques to mitigate DDoS attacks is to minimize the surface area that can be attacked thereby limiting the options for attackers and allowing you to build protections in a single place. We want to ensure that we do not expose our application or resources to ports, protocols or applications from where they do not expect any communication. Thus, minimizing the possible points of attack and letting us concentrate our mitigation efforts. In some cases, you can do this by placing your computation resources behind-Content Distribution Networks (CDNs)-or-Load Balancers-and restricting direct Internet traffic to certain parts of your infrastructure like your database servers. In other cases, you can use firewalls or-Access Control Lists (ACLs)-to control what traffic reaches your applications.

What is a DDoS Attack?

**Which of the following are components of the AWS Risk and Compliance Program?**

* **Control Environment**

* Security Principles

* **Risk Management**

* **Information Security**

* Environment Automation

EXPLANATION
Please see the Risk and Compliance White Paper for more details.

**You have an EC2 Instance in development that interacts with the Simple Storage Service. The EC2 Instance is going to be promoted to the production environment. Which of the following features should be used for secure communication between the EC2 Instance and the Simple Storage Service.**

* **IAM Roles**

* IAM Groups

* IAM Users

* IAM policies

EXPLANATION
An IAM-role-is similar to a user, in that it is an AWS identity with permission policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it. Also, a role does not have standard long-term credentials (password or access keys) associated with it. Instead, if a user assumes a role,-temporary security credentials-are created dynamically and provided to the user.

IAM Roles

**Which of the following is not a category recommendation given by the AWS Trusted Advisor?**

* Fault tolerance

* **High Availability**

* Security

* Performance

* Cost Optimization

EXPLANATION
AWS Trusted Advisor

**A developer wants to gain remote access to an EC2 Instance running Linux without the need of managing a key pair.What EC2 feature will meet this requirement?**

* EC2 Key Pairs

When you create an EC2 instance you get to generate an EC2 Key pair. AWS will hold onto the public key, and you will download the private key.

Since you are downloading the private key, that means you are managing it, and the question asks for a solution which does not require the management of either part of the key pair.

* **Sessions Manager**

Sessions Manager allows you to access an EC2 instance to a Linux virtual without the need of SSH key pairs.

AWS has many ways to connect to an EC2 instance but this is the recommended method.

* AWS IAM Role

You can attach an IAM Role to an EC2 instance but this is for the EC2 instance to have permission to access different AWS resources. It has no relation to the management of key pairs.

* AWS Key Management Service (KMS)

KMS is intended to store customer-managed keys which are used for encryption data. Key Pairs are not encrypted but use hashing. You could store an SSH key pair in KMS, but it would not help manage remote access and KMS does not integrate in that way with EC2.

**Your organization has an operational team that takes care of ID management in their on-premise data center. They now also need to manage users and groups created in AWS. Which of the following AWS tools would they need to use for performing this management function?**

* AWS Cloud Trail

* **AWS Identity and Access Management (IAM)**

* AWS Key Management Service (AWS KMS)

* AWS Config

EXPLANATION
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

What Is IAM?

**True or False: Security in the cloud is the responsibility of AWS.**

* True

* **False**

EXPLANATION
AWS is responsible for the security OF the cloud. The customer is responsible for security IN the cloud -- that is, the security of her AWS resources.

**Which of the following can be used to protect against DDoS attacks.**

* **AWS Shield Advanced**

* **AWS Shield**

* AWS EC2

* AWS ELB

EXPLANATION
AWS Shield - All AWS customers benefit from the automatic protections of AWS Shield Standard, at no additional charge. AWS Shield Standard defends against most common, frequently occurring network and transport layer DDoS attacks that target your web site or applications

AWS Shield Advanced - For higher levels of protection against attacks targeting your web applications running on Amazon EC2, Elastic Load Balancing (ELB), CloudFront, and Route-53 resources, you can subscribe to AWS Shield Advanced. AWS Shield Advanced provides expanded DDoS attack protection for these resources.

How AWS Shield Works

**Which of the following Compliance certifications attests to the security of the AWS platform regarding credit card transactions?**

* SOC 2

AWS System and Organization Controls (SOC) Reports are independent third-party examination reports that demonstrate how AWS achieves key compliance controls and objectives. The purpose of these reports is to help you and your auditors understand the AWS controls established to support operations and compliance.

SOC 2 is an auditing procedure that ensures your service providers securely manage your data to protect the interests of your organization and the privacy of its clients.

https://aws.amazon.com/compliance/soc-faqs/

* **PCI DSS Level 1**

SELECTED
The Payment Card Industry Data Security Standard (PCI DSS) is a proprietary information security standard administered by the PCI Security Standards Council, which was founded by American Express, Discover Financial Services, JCB International, MasterCard Worldwide and Visa Inc.

https://aws.amazon.com/compliance/pci-dss-level-1-faqs/

* FedRamp

The US Federal Government is dedicated to delivering its services to the American people in the most innovative, secure, and cost-efficient fashion. Cloud computing plays a key part in how the federal government can achieve operational efficiencies and innovate on demand to advance their mission across the nation. That is why many federal agencies today are using AWS cloud services to process, store, and transmit federal government data.

https://aws.amazon.com/compliance/fedramp/

* ISO 27001

ISO/IEC 27001:2013 is a security management standard that specifies security management best practices and comprehensive security controls following the ISO/IEC 27002 best practice guidance. The basis of this certification is the development and implementation of a rigorous security program, which includes the development and implementation of an Information Security Management System (ISMS) which defines how AWS perpetually manages security in a holistic, comprehensive manner.

https://aws.amazon.com/compliance/iso-27001-faqs/

EXPLANATION
The following compliance programs are need to know for cloud computing: - PCI DSS - ISO 27001 - FedRamp - SOC 2 - FIPS 180-2


**Which of the following service enables you to assess, audit, and evaluate the configurations of your AWS resources?**

* **AWS Config**

* AWS Cloudwatch

* AWS SNS

* AWS CloudTrail

EXPLANATION
AWS Config is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. Config continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations. With Config, you can review changes in configurations and relationships between AWS resources, dive into detailed resource configuration histories, and determine your overall compliance against the configurations specified in your internal guidelines. This enables you to simplify compliance auditing, security analysis, change management, and operational troubleshooting.

AWS Config

**When creating security groups, which of the following is a responsibility of the customer. Choose 2 answers from the options given below.**

* **Giving a name and description for the security group**

* **Defining the rules as per the customer requirements.**

* Ensure the security groups are linked to the Elastic Network interface

* Ensure the rules are applied immediately

EXPLANATION
When you define security rules for EC2 Instances, you give a name, description and write the rules for the security group

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html

**What actions within an AWS Account can only be performed by an AWS Account root user?**

* **Create an Account**

This is true. You can create additional AWS accounts when you have an AWS Organization.

* Turn on Mult-Factor Authentication

This is not true. Any user can turn on MFA.

* **Create an AWS Organization**

This is true. Creating an AWS Organization changes an account to have a multi-account structure. Once turned on, AWS Organizations cannot be turned off.

* **Updating Billing Information**

This is true. Only the root account can change account level information.

* Rotate AWS Access Keys

This is not true. Any user can rotate their own AWS Access keys.

EXPLANATION
Another thing that can only be done by the root user is to Close an Account (suspend an account) AWS accounts cannot be deleted.

**An enterprise using AWS wants to provide to its billing department a detailed breakdown of the costs and usage of various services. They want the report in a CSV file for the month to the current date so they can analyze the data within Microsoft Excel.Which AWS Billing service would meet this requirement?**

* **AWS Cost and Usage Reports**

The AWS Cost and Usage Reports (AWS CUR) contains the most comprehensive set of cost and usage data available. You can use Cost and Usage Reports to publish your AWS billing reports to an Amazon Simple Storage Service (Amazon S3) bucket that you own. You can receive reports that break down your costs by the hour, day, or month, by product or product resource, or by tags that you define yourself. AWS updates the report in your bucket once a day in comma-separated value (CSV) format. You can view the reports using spreadsheet software such as Microsoft Excel or Apache OpenOffice Calc, or access them from an application using the Amazon S3 API.

Each update in a given month is cumulative, so each version of the Cost and Usage Reports includes all of the billing data for the month to date. The reports generated throughout the month are estimated and subject to change during the rest of the month as you continue to use your AWS services. Different AWS services provide your usage-based billing information at different times, so you may notice updates to a certain hour or day come in at different times. AWS finalizes the Cost and Usage Report's usage charges at the end of the month after an invoice has been issued for your usage charges.

https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html

* AWS Pricing Calculator

* AWS Budgets

* AWS Cost Explorer

**There is a requirement to host a database server for a minimum period of one year. Which of the following would result in the least cost?**

* On-Demand

On-Demand is not the most cost efficient solution.

* No Upfront costs Reserved

No upfront payment is required , however its costlier option than Partial/All upfront payment.

https://docs.aws.amazon.com/aws-technical-content/latest/cost-optimization-reservation-models/reserved-instance-payment-options.html

* Spot Instances

Spot instances can be terminated with fluctuations in market prices. Unless the question specifies a use case where high availability is not a requirement, this cannot be assumed.

* **Partial Upfront costs Reserved**

If the database is going to be used for a minimum of one year at least , then it is better to get Reserved Instances. You can save on costs , and if you use a partial upfront options , you can get a better discount

https://aws.amazon.com/ec2/pricing/reserved-instances/


**You have two accounts in your AWS Organization. One for the Dev and the other for QA. All are part of consolidated billing. The master account has purchased three reserved instances. The Dev department is currently using two reserved instances. The QA team plans to use three instances of the same instance type.What is the pricing tier of the instances that the QA Team can use?**

* **One Reserved and two On-Demand**

* Two Reserved and one On-Demand

* Three Reserved and no On-Demand

* No Reserved and three On-Demand

EXPLANATION
Since all are a part of consolidating billing, All can share the pricing of reserved instances. And since two are already used by the Dev team, another one can be used by the QA team. The rest of the instances can be on-demand instances.

<img src="instancereserve.png">

**Which of the following best describes a Resource Group?**

* **A resource group is a collection of resources that share one or more tags (or portions of tags.)**

* A resource group is a collection of resources that are deployed in the same AWS Region.

* A resource group is a collection of resources of the same type (EC2, S3, etc.) that are deployed in the same Availability Zone.

* A resource group is a collection of resources of the same type (EC2, S3, etc.) that share one or more tags or portions of tags.

EXPLANATION
A resource group is a collection of resources that share one or more tags (or portions of tags.)

**In order to predict the cost of moving resources from on-premise to the cloud, which of the following can be used?**

* AWS WAF

* **AWS Pricing Calculator**

* AWS Inspector

* AWS Trusted Advisor

EXPLANATION
The AWS TCO calculator makes it easy to estimate your savings when comparing the cloud to an on-premises or colocation environment. Use the TCO calculator to get detailed reports and insights into the cost components that make AWS a viable alternative to lower your costs.

Cloud Economics Center

**Which AWS service is used to calculate the Total Cost of Ownership?**

* TCO Calculator

This was a thing, but AWS replaced it with the AWS Pricing Calculator

https://aws.amazon.com/blogs/aws/new-cloud-tco-comparison-calculator-for-web-applications/

* AWS Budgets

AWS Budgets allows you to set custom budgets to track your cost and usage from the simplest to the most complex use cases. With AWS Budgets, you can choose to be alerted by email or SNS notification when actual or forecasted cost and usage exceed your budget threshold, or when your actual RI and Savings Plans' utilization or coverage drops below your desired threshold.

* AWS Cost Explorer

AWS Cost Explorer has an easy-to-use interface that lets you visualize, understand, and manage your AWS costs and usage over time.

* **AWS Pricing Calculator**

**An organization with multiple AWS accounts wants to take advantage of volume pricing discounts across their AWS accounts, have their shared billing appear within a single AWS account for billing.Which AWS billing feature would provide this functionality?**

* Cost Explorer

* AWS Cost and Usage Reports

* Savings Plan

* AWS Budgets

* **Consolidated Billing**

You can use the consolidated billing feature in AWS Organizations to consolidate billing and payment for multiple AWS accounts or multiple Amazon Internet Services Pvt. Ltd (AISPL) accounts. Every organization in AWS Organizations has a management account that pays the charges of all the member accounts. For more information about organizations, see the AWS Organizations User Guide.

Consolidated billing has the following benefits:
One bill – You get one bill for multiple accounts.
Easy tracking – You can track the charges across multiple accounts and download the combined cost and usage data.
Combined usage – You can combine the usage across all accounts in the organization to share the volume pricing discounts, Reserved Instance discounts, and Savings Plans. This can result in a lower charge for your project, department, or company than with individual standalone accounts. For more information, see Volume discounts.
No extra fee – Consolidated billing is offered at no additional cost.
https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html

**When working on the costing for on-demand EC2 instances , which are the following are attributes which determine the costing of the EC2 Instance.**

* **AMI Type**

* **Instance Type**

* **Region**

* Edge location

EXPLANATION
If you see the below snapshot from the EC2 on-demand pricing page, you can see the different components that make up the pricing

Amazon EC2 Pricing/

**Which of the following concepts is used when you want to manage the bills for multiple accounts under one master account?**

* Combined Billing

Incorrect. This is not AWS terminology

* **Consolidated billing**

You can use the consolidated billing feature in AWS Organizations to consolidate payment for multiple AWS accounts or multiple AISPL accounts. With consolidated billing, you can see a combined view of AWS charges incurred by all of your accounts. You also can get a cost report for each member account that is associated with your master account. Consolidated billing is offered at no additional charge

* IAM

Incorrect. In IAM is for creating and managing AWS users and groups, and using permissions to allow or deny their access to AWS resources. It is not a billing tool.

* Cost Explorer

Incorrect. AWS Cost Explorer lets you visualize, understand, and manage your AWS costs. But it is not for managing bills of multiple accounts

EXPLANATION
Consolidated Billing for Organizations: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html

**Your company is planning to move to the AWS Cloud. You need to give a presentation on the cost perspective when moving existing resources to the AWS Cloud. When it comes to Amazon EC2, which of the following is an advantage when it comes to the cost perspective.**

* Ability to tag instances to reduce the overallcost

* **The ability to only pay for what you use**

* Having the ability of automated backups of the EC2 instance, so that you don’t need to worry about the maintenance costs.

* The ability to choose low cost AMI’s to preparethe EC2 Instances

EXPLANATION
One of the advantages of EC2 Instances is the per second billing concept. This is given in the AWS documentation also

With per-second billing, you pay for only what you use. It takes cost of unused minutes and seconds in an hour off of the bill, so you can focus on improving your applications instead of maximizing usage to the hour. Especially, if you manage instances running for irregular periods of time, such as dev/testing, data processing, analytics, batch processing and gaming applications, can benefit.

Amazon EC2 pricing

**Which of the following best describes a system that is always available — without the need for human intervention?**

* Scalable

* Fault tolerant

* Elastic

* **Highly Available**

EXPLANATION
A highly available system is one that is always available — without the need for human intervention

**Which of the following are examples of Capital Expenses (CAPEX)?**

* Leasing Software

* **Network Costs**

* **Datacenter Costs**

* Billing Based on Compute Metrics

* **IT Personnel**

EXPLANATION
CAPEX is about spending money upfront for physical expenditures. If you have your own data center most costs are going to be CAPEX.

You need to physically buy servers, buy the physical cabling to network those servers together, hire IT personnel set up and maintain those servers.

A recommended read would be Cloud, CapEx, and OpEx: Reframing the Conversation

https://www.investopedia.com/terms/c/capitalexpenditure.asp#:~:text=Capital%20expenditures%20(CapEx)%20are%20funds,or%20investments%20by%20a%20company.

**A company has an existing on-premise relational database. They want to migrate this database to the cloud and are willing to adopt a NoSQL database in order to gain managed sharding and provisioned throughput with a guarantee of performance at any scale.Which NoSQL offering on AWS would be suited for this workload?**

* Amazon Relational Database Service

Amazon Relational Database Service (RDS) is a relational database

It's not a NoSQL databases It's not fully managed, you have to figure out sharing. It does not have provisioned throughput. You have to figure out sharding yourself.

* Amazon Aurora

Amazon Aurora is a fully managed relational database

Amazon Aurora can scale very well, and sharing is handle by the service. However, it's not a NoSQL databases

It does not have provisioned throughput.

* DocumentDB

DocumentDB is a Document database. A document database is a type of NoSQL databases

DocumentDB does not have the same scaling capabilities as DynamoDB. The question does not call for a document type data structure.

* **DynamoDB**

SELECTED
The company said the explicitly wanted to use a NoSQL solution. DynamoDB allows you to set your provisioned throughput eg. I want to have 100 read and writes per second, and it's guaranteed. DynamoDB sharding is managed. You do have to plan your data modelling a bit around sharding, but you don't have to manage shards.

DynamoDB is AWS's flagship database. Whenever we are talking about at scale with a guarantee, DynamoDB is always first on that list.

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html

* Amazon Neptune

Amazon Neptune is a graph database. This would be the answer if the question specifically asks for a graph database or describe how it requires richer feature set around relationships and entities

Amazon Neptune is a fast, reliable, fully managed graph database service that makes it easy to build and run applications that work with highly connected datasets. The core of Neptune is a purpose-built, high-performance graph database engine. This engine is optimized for storing billions of relationships and querying the graph with milliseconds latency. Neptune supports the popular graph query languages Apache TinkerPop Gremlin and W3C’s SPARQL, enabling you to build queries that efficiently navigate highly connected datasets. Neptune powers graph use cases such as recommendation engines, fraud detection, knowledge graphs, drug discovery, and network security.

A graph database is a type of NoSQL databases

https://docs.aws.amazon.com/neptune/latest/userguide/intro.html

**A company is building out a proof-of-concept on AWS to kick start their migration to the cloud. Previously the developers would need to submit a request to their centralized IT department to set up a physical machine with a hypervisor installed to utilize Virtualisation.However, with AWS they can self-provision resources within minutes.What best describes this cloud benefit?**

* Reliability

A measure of your workload's ability to provide functionality when desired by the user.

https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.c-reliability.en.html

AWS has lots of monitoring tools to collect metrics, some that are built-in by default, some that you have to explicitly turn on.

The ability to measure your workloads is what makes the cloud reliable

* Global Reach

Go global in minutes – Easily deploy your application in multiple regions around the world with just a few clicks. This means you can provide lower latency and a better experience for your customers at minimal cost.

* Elasticity

The ability to acquire resources as you need them and release resources when you no longer need them. In the cloud, you want to do this automatically.

https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.elasticity.en.html

* **Agility**

SELECTED
Increase speed and agility – In a cloud computing environment, new IT resources are only a click away, which means that you reduce the time to make those resources available to your developers from weeks to just minutes. This results in a dramatic increase in agility for the organization since the cost and time it takes to experiment and develop is significantly lower.

EXPLANATION
The exam guide outline lists the following benifits of AWS Cloud - Security
- Reliability
- High Availability
- Elasticity
- Agility
- Pay-as-you go pricing
- Scalability
- Global Reach
- Economy of scale

This list is not found elsewhere outside the AWS exam guide and appears to mix the 6 advantages of cloud computing and the 5 pillars of the well-architectured framework.

https://docs.aws.amazon.com/whitepapers/latest/aws-overview/six-advantages-of-cloud-computing.html https://aws.amazon.com/blogs/apn/the-5-pillars-of-the-aws-well-architected-framework/

**A Disaster Recovery Strategy on AWS should be based on launching resources in a separate :**

* Amazon Virtual Private Cloud (Amazon VPC)

* **AWS Region**

Businesses are using the AWS cloud to enable faster disaster recovery of their critical IT systems without incurring the infrastructure expense of a second physical site. The AWS cloud supports many popular disaster recovery (DR) architectures from “pilot light” environments that may be suitable for small customer workload data center failures to “hot standby” environments that enable rapid failover at scale. With-data centers in Regions all around the world, AWS provides a set of cloud-based disaster recovery services that enable rapid recovery of your IT infrastructure and data.

Businesses are using the AWS cloud to enable faster disaster recovery of their critical IT systems without incurring the infrastructure expense of a second physical site. The AWS cloud supports many popular disaster recovery (DR) architectures from “pilot light” environments that may be suitable for small customer workload data center failures to “hot standby” environments that enable rapid failover at scale. With-data centers in Regions all around the world, AWS provides a set of cloud-based disaster recovery services that enable rapid recovery of your IT infrastructure and data.

* Subnet

* Security Group

**What are the benefits of elasticity in the AWS Cloud?**

* Reduce storage expenses by archiving log data automatically.

* Allow AWS to select the most cost-effective services for you.

* **Automatically adjust the required compute capacity to maintain consistent performance.**

* Ensure that web traffic is distributed evenly across several AWS Regions.

EXPLANATION
Elasticity - The ability to acquire resources as you need them and release resources when you no longer need them. In the cloud, you want to do this automatically.

https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.elasticity.en.html

**What is the advantage of decoupling services vs having a large monolithic application?**

* **Reduce inter-dependencies so failures do not impact critical services**

* Better data flow between IP socks

This is just gibberish

* Improved Performance

* Create a tightly integrated application

This is the opposite of decoupling

**Which of the following are advantages of having infrastructure hosted on the AWS Cloud?Choose 2 answers from the options given below.**

* Having complete control over the physical infrastructure

incorrect as the Physical infrastructure is a responsibility of AWS and not with the customer. Hence it is not an advantage of moving to the AWS Cloud.

* **Having the pay as you go model**

with AWS you only pay for what you use. easily scale your infrastructure to meet your own company needs.

* Having no need to worry about security

incorrect as AWS provides security mechanisms, but the responsibility of security lies with the customer

* **No Upfront costs**

there are no upfront costs to get started using the AWS infrastructure

EXPLANATION
Answer No Upfront costs Having the pay as you go model


**When architecting for the cloud AWS has a best practice called Design for failure and nothing will fail. Which of the following would provide the greatest amount of fault-tolerance?**

* Utilizing a Load Balancer and Auto Scaling Groups

A Load Balancer can distribute traffic across multiple Availability Zones and an Auto Scaling Group can ensure a minimum amount of instances are always running. Both of these services contribute to building fault-tolerant system. The reason this is not the correct answer is because this only allows us to fail between multiple Availability Zones since a Load Balancer can not distribute traffic across regions. In order to do this we would need Route53 which could fail over traffic to two different Load Balancer in two different Regions. Since we have another question that has Region and AZ fail over its is the more correct answer.

* **Deploying an application across multiple Availability Zones and Regions**

Each AZ is a set of one or more data centers. By deploying your AWS resources to multiple Availability Zones , you are designing with failure with mind. So if one AZ were to go down , the other AZ’s would still be up and running and hence your application would be more fault tolerant.

* Regions and Availability Zonesl

* Deploying your application across multiple Edge Locations

Edge Locations are used by CloudFront. CloudFront is a CDN that will create cached copies of your static content to multiple Edge Locations. The purpose of a CDN is to improve load times of your content by providing nearby cache copies instead of fetching your content from a faraway data center. Since the question is talking about an application which suggests dynamic content and Edge Locations are used with CloudFront which is for static content this should indicate to you this is not the correct answer.

* Setting CloudWatch Events to create scheduled automated backups.

In https://media.amazonwebservices.com/AWSCloudBest_Practices.pdf on Page 12 you can see that utilizing CloudWatch is a tactic would contribute to architecting fault-tolerant system. The reason this is not the correct answer is because having a backup does not guarantee the chance of downtime and its important that you have multiple instances already running you can immediately fail over to.

EXPLANATION
Whenever you see failure you should think about fault-tolerance and fail-overs


**Which of the following are geographic areas that host two or more Availability Zones?**

* AWS Origins

* **Regions**

* Compute Zones

* Edge Locations

EXPLANATION
A Region is a geographic area that hosts two or more Availability Zones.


**What is the concept of an AWS region?**

* **It is a geographical area divided into Availability Zones**

* It is a collection of Edge locations

* It is the same as an Availability zone

* It is a collection of Compute capacity

EXPLANATION
A region is a geographical area divided into Availability Zones. Each region contains at least two Availability Zones.

Regions and Availability Zones


**Which of the following disaster recovery deployment mechanisms that has the highest downtime**

* **Backup and Restore**

* Multi Site

* Warm standby

* Pilot light

EXPLANATION
The below snapshot from the AWS Documentation shows the spectrum of the Disaster recovery methods. If you go to the further end of the spectrum you have the least time for downtime for the users.

New Whitepaper: Using AWS for Disaster Recovery


**Which of the following is not AWS responsibility under the Shared Responsibility Model?**

* Networking

* Physical Security of AWS datacenters

* **Customer data**

Hypervisors

EXPLANATION
The customer is responsible for her own customer data.


**A company wants to have a database hosted on AWS. As much as possible they want to have control over the database itself. Which of the following would be an ideal option for this.**

* **Hosting on the database on an EC2 Instance**

* Using the AWS RDS service

* Using the AWS DynamoDB service

* Using the Amazon Aurora service

EXPLANATION
If you want a self-managed database, that means you want complete control over the database engine and the underlying infrastructure. In such a case you need to host the database on an EC2 Instance

https://aws.amazon.com/ec2/


**You have a mission-critical application which must be globally available at all times. Which deployment strategy should you follow?**

* **Multi-Region**

* Multi-Availability Zone

* Deploy to all Availability Zones in your home region.

* Multi-VPC in two AWS Regions

EXPLANATION
A Multi-Region deployment will best ensure global availability.


**Which AWS service allows for distribution of incoming application traffic across multiple EC2 instances?**

* **AWS ELB**

* AWS Autoscaling

* AWS Inspector

* AWS EC2

EXPLANATION
Elastic Load Balancing distributes incoming application traffic across multiple EC2 instances, in multiple Availability Zones. This increases the fault tolerance of your applications.

What Is Elastic Load Balancing?