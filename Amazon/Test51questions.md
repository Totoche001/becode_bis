**An AWS Availability Zone (AZ) is a single point of failure. To avoid a single point of failure, a company needs to deploy its workload across multiple AZs in the same AWS Region.**

* TRUE
* **FALSE**

An Availability Zone (AZ) is not a single point of failure.

An AZ can be composed of multiple data centers at a single location (separate building per data center) Within a data center, hardware is physically isolated from each other in the case of a disaster. So, for example, if one room catches fire, the other rooms will not be affected.

**A company has an EC2 instance running and suddenly the server was terminated. It's suspected that a junior developer may have terminated this instance by mistake.**

Which AWS service will help determining who was responsible?

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


**What is the advantage of decoupling services vs having a large monolithic application?**

* **Reduce inter-dependencies so failures do not impact critical services**

* Better data flow between IP socks

* This is just gibberish

* Improved Performance

* Create a tightly integrated application

* This is the opposite of decoupling

**A small business wants to deploy a Wordpress website with a custom domain on AWS but they have minimal knowledge of AWS.Which AWS service offering would be the easiest solution for this customer?**

* AWS Elastic Beanstalk

You can deploy a wordpress on Elastic Beanstalk but requires developer knowledge to do so.

* AWS CodeStar

You can launch WordPress from CodeStar. It's not as easy as LightSail and does not handle domain registry as well. This sill requires developer knowledge. AWS CodeStar generally launches AWS Elastic Beanstalk environments.

* **Amazon LightSail**

Lighsail an easy-to-use UI to launch common workloads that you might found on providers like Godaddy or HostGator. You can easily launch WordPress, Joomla, Magento and more... You can also register a custom domain through LightSail

LightSail is just using EC2, Route53 and other AWS services underneath. These service resources will be managed by AWS eg. You will not see the EC2 in your EC2 console, only in LightSail.

Lightsail is an easy-to-use virtual private server (VPS) provider that offers you everything needed to build an application or website for a cost-effective, monthly plan. Whether you’re new to the cloud or looking to get on the cloud quickly with AWS infrastructure you trust, we’ve got you covered.

https://aws.amazon.com/lightsail/

* AWS Amplify

**AWS Amplify is an opinionated serverless framework and hosting platform for AWS. It requires developer knowledge and can't be used to deploy a WordPress which is incompatible. Which AWS security services are used in mitigating DDoS attacks?**

* **AWS WAF**

AWS WAF is provided for free when you pay for AWS Shield Advanced. AWS WAF is to protect against Layer 7 attacks.

Layer 7 is the Application Layer.

AWS WAF is a Web Application Fire Wall.

* **AWS Shield Advanced**

AWS Shield Advanced is paid tier of AWS Shield which includes protection for Layer 3/4 and Layer 7 attacks

* NACLs

Network Access Controls act as a virtual firewall at the subnet level.

* **AWS Shield**

AWS Shield protects against Layer 3/4 attacks

Security Groups

Security Groups act as a virtual firewall at the resource level eg. EC2 instances

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

The company said the explicitly wanted to use a NoSQL solution. DynamoDB allows you to set your provisioned throughput eg. I want to have 100 read and writes per second, and it's guaranteed. DynamoDB sharding is managed. You do have to plan your data modelling a bit around sharding, but you don't have to manage shards.

DynamoDB is AWS's flagship database. Whenever we are talking about at scale with a guarantee, DynamoDB is always first on that list.

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html

* Amazon Neptune

Amazon Neptune is a graph database. This would be the answer if the question specifically asks for a graph database or describe how it requires richer feature set around relationships and entities

Amazon Neptune is a fast, reliable, fully managed graph database service that makes it easy to build and run applications that work with highly connected datasets. The core of Neptune is a purpose-built, high-performance graph database engine. This engine is optimized for storing billions of relationships and querying the graph with milliseconds latency. Neptune supports the popular graph query languages Apache TinkerPop Gremlin and W3C’s SPARQL, enabling you to build queries that efficiently navigate highly connected datasets. Neptune powers graph use cases such as recommendation engines, fraud detection, knowledge graphs, drug discovery, and network security.

A graph database is a type of NoSQL databases

https://docs.aws.amazon.com/neptune/latest/userguide/intro.html

**The customer is responsible for security in the cloud.**

* False

* **True**

EXPLANATION
Customers are responsible for security in the cloud.

AWS is responsible for the security of the cloud.

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

**A company has multiple EC2 instances managed by an Auto Scaling Group and behind an Application Load Balancer. The instances are used to run internal company services, and there are foreseen changes in traffic or usage for the next few years.Which of the following would the EC2 Pricing model be ideal for reducing to cost of these servers?**

* Spot

* Dedicated

* **Reserved Instances**

Reserved Instances allow you to save on compute costs if you tell AWS upfront what your usage will be and/or if you sign a contract to receive a discount.

With RIs, you can choose the type that best fits the needs of your application.

Standard RIs: These provide the most significant discount (up to 72% off On-Demand) and are best suited for steady-state usage.
Convertible RIs: These provide a discount (up to 54% off On-Demand) and the capability to change the attributes of the RI as long as the exchange results in the creation of Reserved Instances of equal or greater value. Like Standard RIs, Convertible RIs are best suited for steady-state usage.
Scheduled RIs: These are available to launch within the time windows you reserve. This option allows you to match your capacity reservation to a predictable recurring schedule that only requires a fraction of a day, a week, or a month.
https://aws.amazon.com/ec2/pricing/reserved-instances/

* On-Demand

**An AWS customer benefits from built-in security provided by AWS data centers and networks which are architected to protect your information, identities, applications, and devices.**

* Security is not an offering of AWS, you need to use third-party tools security tools

This is a distractor. AWS has many cloud services dedicated to security, and secures all the underlying infrastructure for you like the data centers and physical networks.

* Security is not an essential benefit of AWS Cloud

Security is listed as a benefit of AWS Cloud in the exam guide.

* **Security is an essential benefit of AWS Cloud**

As an AWS customer, you will benefit from AWS data centers and a network architected to protect your information, identities, applications, and devices. With AWS, you can improve your ability to meet core security and compliance requirements, such as data locality, protection, and confidentiality with our comprehensive services and features.

https://aws.amazon.com/security/

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

**A company has a web application that they determined requires at least 2 running servers to meet their operational performance service level agreements (SLAs) with their customers.The company has deployed 3 identical servers across 3 different availability zones in a single region.Which AWS Cloud benefit does this describe?**

* Elasticity

Elasticity is the ability to add or remove servers automatically based on rules or metrics such as CPU, Network IN, Memory and more.

Elasticity is not exclusive to Virtual Machines, and sometimes Elasticity is built-in like serverless services so it's abstracted away.

Elasticity means that your resources will automatically be right-sized for the emerging capacity requirements.

* **High Availability**

High Availability (HA) is when your cloud service or app remains available. HA is focused on uptime and operational performance.

uptime - does this service remain available if an AWS Availability Zone or AWS Region becomes unavailable due to a technical issue, or unforeseen disaster

operational performance - how fast can users access the service. Is it slow to the point that the service is not useful?

High Availability is commonly confused with Disaster Recovery and Fault Torlance since HA has overlapping responsibilities.

* Global Reach

Go global in minutes – Easily deploy your application in multiple regions around the world with just a few clicks. This means you can provide lower latency and a better experience for your customers at a minimal cost.

* Reliability

A measure of your workload's ability to provide functionality when desired by the user.

https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.c-reliability.en.html

AWS has lots of monitoring tools to collect metrics, some that are built-in by default, some that you have to explicitly turn on.

The ability to measure your workloads is what makes the cloud reliable

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

**An enterprise using AWS wants to provide to its billing department a detailed breakdown of the costs and usage of various services. They want the report in a CSV file for the month to the current date so they can analyze the data within Microsoft Excel.Which AWS Billing service would meet this requirement?**

* AWS Pricing Calculator

* **AWS Cost and Usage Reports**

The AWS Cost and Usage Reports (AWS CUR) contains the most comprehensive set of cost and usage data available. You can use Cost and Usage Reports to publish your AWS billing reports to an Amazon Simple Storage Service (Amazon S3) bucket that you own. You can receive reports that break down your costs by the hour, day, or month, by product or product resource, or by tags that you define yourself. AWS updates the report in your bucket once a day in comma-separated value (CSV) format. You can view the reports using spreadsheet software such as Microsoft Excel or Apache OpenOffice Calc, or access them from an application using the Amazon S3 API.

Each update in a given month is cumulative, so each version of the Cost and Usage Reports includes all of the billing data for the month to date. The reports generated throughout the month are estimated and subject to change during the rest of the month as you continue to use your AWS services. Different AWS services provide your usage-based billing information at different times, so you may notice updates to a certain hour or day come in at different times. AWS finalizes the Cost and Usage Report's usage charges at the end of the month after an invoice has been issued for your usage charges.

https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html

* AWS Budgets

* AWS Cost Explorer

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

**Which AWS billing services are capable of forecasting cost and usage?**

* **AWS Budgets**

AWS Budgets can forecast cost and usage. You can set alerts in case you are passing a forecasted threshold.

* Amazon Forecast

Amazon Forecast is a time-series database. It forecasts, but not directly with AWS billing information.

* **AWS Cost Explorer**

AWS Cost Explorer can forecast cost and usage with granular detail. AWS Cost Explorer is useful for speculative reporting.

* AWS Cost and Usage Report

AWS Cost and Usage Report is is a download CSV of detailed cost breakdown for the current month up to the current day. It does not Forecast

**A company has been outputting AWS Cost and Usage Reports to an S3 Bucket.The Chief Financial Officer(CFO) of the company wants to use an AWS service to visualize this cost.Which AWS service would be ideal for this use case?**

* AWS Tableau

Tableau is a popular Business Intelligence (BI) tool.

The CEO of AWS was previously the CEO of Tableau

Tableau is not an AWS service.

* **Amazon Quicksight**

Amazon Quicksight is a Business Intelligence (BI) tool.

Amazon Quicksight can inject data sources from various AWS storage and databases services such as S3.

Amazon QuickSight is a cloud-scale business intelligence (BI) service that you can use to deliver easy-to-understand insights to the people who you work with, wherever they are. Amazon QuickSight connects to your data in the cloud and combines data from many different sources. In a single data dashboard, QuickSight can include AWS data, third-party data, big data, spreadsheet data, SaaS data, B2B data, and more. As a fully managed cloud-based service, Amazon QuickSight provides enterprise-grade security, global availability, and built-in redundancy. It also provides the user-management tools that you need to scale from 10 users to 10,000, all with no infrastructure to deploy or manage.

QuickSight gives decision-makers the opportunity to explore and interpret information in an interactive visual environment. They have secure access to dashboards from any device on your network and from mobile devices.

https://docs.aws.amazon.com/quicksight/latest/user/welcome.html https://aws.amazon.com/premiumsupport/knowledge-center/quicksight-cost-usage-report/

**What best describes Right-Sizing EC2 instances?**

* **Matching workload performance and capacity requirements at the lowest possible cost**

Right-sizing is about choosing the instance-type and instance-size as close to your requirements. You don't much need wiggle room, since you can use Auto Scaling Groups to increase your capacity automatically when approaching a specific threshold of usage.

* **Identifying opportunities to eliminate or downsize without compromising capacity or other requirements,**

Right-sizing is a key mechanism for optimizing AWS costs. So you want to use right-sizing to reduce compute waste which leads to operational costs wastss.

* Matching workload performance and capacity requirements based on quarterly or annual timelines

Right-sizing can be done at any time. You do not need to have underutilize compute available in case of an increase in demand,

* **Continually analyzing instance performance and usage needs and patterns**

Right-sizing should be Continually evaluated and when possible programmatically and automatically.

* Prioritize speed and performance over cost

Right-sizing is about choosing the most optimal cost alongside speed and performance.

EXPLANATION
https://aws.amazon.com/aws-cost-management/aws-cost-optimization/right-sizing/

Right sizing is the process of matching instance types and sizes to your workload performance and capacity requirements at the lowest possible cost. It’s also the process of looking at deployed instances and identifying opportunities to eliminate or downsize without compromising capacity or other requirements, which results in lower costs.

Right sizing is a key mechanism for optimizing AWS costs, but it is often ignored by organizations when they first move to the AWS Cloud. They lift and shift their environments and expect to right size later. Speed and performance are often prioritized over cost, which results in oversized instances and a lot of wasted spend on unused resources.

Right sizing is the most effective way to control cloud costs. It involves continually analyzing instance performance and usage needs and patterns—and then turning off idle instances and right sizing instances that are either overprovisioned or poorly matched to the workload. Because your resource needs are always changing, right sizing must become an ongoing process to continually achieve cost optimization. You can make right sizing a smooth process by establishing a right-sizing schedule for each team, enforcing tagging for all instances, and taking full advantage of the powerful tools that AWS and others provide to simplify resource monitoring and analysis.

**A company needs a dedicated connection from their on-premise data center to their AWS Cloud VPC.Which AWS service will meet this requirement?**

* **AWS Direct Connect**

AWS Direct Connect is a cloud service solution that makes it easy to establish a dedicated network connection from your premises to AWS. Using AWS Direct Connect, you create a private connection between AWS and your data center, office, or colocation environment. This can increase bandwidth throughput and provide a more consistent network experience than internet-based connections.

https://aws.amazon.com/directconnect/

* Route53

Route53 is a highly available and scalable Domain Name System (DNS) web service. You can use Route 53 to perform three main functions in any combination: domain registration, DNS routing, and health checking.

https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html

* Amazon Connect

Amazon Connect is an easy to use omnichannel cloud contact center that helps companies provide superior customer service across voice, chat, and tasks at a lower cost than traditional contact center systems.

https://aws.amazon.com/connect/features/

* VPC Peering

A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network.

https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html

EXPLANATION
When establishing a connection between on-premise and AWS two services always come up:

AWS Direct Connect - establishes dedicated connections (make it fast)
AWS VPN - establishes encrypted connections (make it safe)
AWS Direct Connect and AWS VPN can be used together, and they often should be.

**A company wants to ensure that Termination Protection is turned on for all their EC2 instance.Which AWS service can ensure this configuration remains set and could possibly remediate the issue automatically?**

* AWS GuardDuty

GaurdDuty is an Intrusion Detection and Protection service. It detects malicious-looking behaviour from various security logs.

* AWS CloudFormation

CloudFormation is for writing Infrastructure as Code. You could use CloudFormation to provision an AWS Config rule.

* AWS IAM Role

* **AWS Config**

AWS Config is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. Config continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations. With Config, you can review changes in configurations and relationships between AWS resources, dive into detailed resource configuration histories, and determine your overall compliance against the configurations specified in your internal guidelines. This enables you to simplify compliance auditing, security analysis, change management, and operational troubleshooting.

https://aws.amazon.com/config/

**A developer has a web application that is behind an Application Load Balancer. They want to protect their web app against common attack patterns, such as SQL injection or cross-site scripting.Which AWS Service will meet this requirement?**

* **AWS WAF**

AWS Web Application Firewall monitor requests forwarded from CloudFront or ALB allowing you control access to said requests AWS WAF

* AWS Security Hub

AWS Security Hub is a cloud security posture management service that performs security best practice checks, aggregates alerts, and enables automated remediation.

* AWS GuardDuty

AWS GuardDuty is a real-time intrusion detection service that continuously analyzes CloudTrail, DNS, and VPC Flow Logs to detect threats or unusual behaviour. It's not intended to analyze or control web requests.

* AWS Shield

AWS Shield is a managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigations that minimize application downtime and latency, so there is no need to engage AWS Support to benefit from DDoS protection. There are two tiers of AWS Shield - Standard and Advanced.

**Which of the following benefits would be attractive to a company moving from on-premise to AWS?**

* **Flexible**

* Control of Physical Servers

* Pay Up Front

* **Cost-Effective**

SELECTED
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

**A new company has decided they will exclusively run all of their infrastructure on AWS.What is the name of this cloud deployment model?**

* Hybrid

Hybrid is when a company runs a workload across a - a private cloud operating on-premise - and public clouds such as AWS

* **Cloud-Native**

Cloud-Native describes a company that runs its workload entirely on the public cloud.

Public cloud is a company that offers a variety of cloud services for - Infrastructure as a Service - Platform as a Service - Software as a Service And all of these services can be interacted with a unified API and/or UI web interface.

* **Cloud-First**

* On-Premise

On-Premise means a company that operates its own data center or has its workloads running within its own building. This is the opposite of cloud-native.

EXPLANATION
AWS does not have any explicit documentation describing cloud-native. It's an industry term

**An organization has many departments that manage its own AWS accounts.The Chief Information Officer(CIO) has a concern about the departments operating their own ShadowIT due to a lack of security controls.Which AWS Service can be implemented to allow AWS Account owners to access a list of technology stacks built by the company that is pre-approved and self-serve?**

* AWS Systems Manager

AWS Systems Manager is an umbrella service for many services. Generally aimed around managing Virtual Machines.

* AWS Organizations

AWS Organizations is used for creating and managing multiple AWS accounts. It does not define a list of preapproved tech stacks to be easily deployed.

* AWS Stack List

No such service

* **AWS Service Catalog**

AWS Service Catalog allows organizations to create and manage catalogs of IT services that are approved for use on AWS. These IT services can include everything from virtual machine images, servers, software, and databases to complete multi-tier application architectures. AWS Service Catalog allows you to centrally manage deployed IT services and your applications, resources, and metadata.

**A startup company is adopting a cloud-native approach by building its web application using AWS cloud services.Which of the following cloud benefits will help keep their operational costs low?**

* High Availability

High Availability (HA) is when your cloud service or app remains available. HA is focused on uptime and operational performance.

uptime - does this service remain available if an AWS Availability Zone or AWS Region becomes unavailable due to a technical issue or unforeseen disaster?

operational performance - how fast can users access the service? Is it slow to the point that the service is not useful?

HAS is commonly confused with Disaster Recovery and Fault Torlance since HA has overlapping responsibilities.

* Elasticity

Elasticity is the ability to add or remove servers automatically based on rules or metrics such as CPU, Network IN, Memory, and more.

Elasticity is not exclusive to Virtual Machines, and sometimes Elasticity is built-in like serverless services so it's abstracted away.

* **Pay-as-you go pricing**

Pay-as-you-go (PAYG) pricing is also known as "On Demand".

What you consume is what you pay.

They don't have to commit lots of money upfront and try to plan (stop guessing) for capacity.

* **Economy of scale**

Economy of scale is when you share the cost with other customers.

AWS has a data center full of physical servers, and customers are running on the same hardware but are virtually isolated via Virtual Machines (VMs). A customer that shares hardware with other customers is known as "multi-tenancy". Think of an apartment building that has multiple tenants.

EXPLANATION
The exam guide outline lists the following benefits of AWS Cloud - Security
- Reliability
- High Availability
- Elasticity
- Agility
- Pay-as-you-go pricing
- Scalability
- Global Reach
- Economy of scale

This list is not found outside the AWS exam guide and appears to mix the six advantages of cloud computing and the six pillars of the well-architectured framework.

https://docs.aws.amazon.com/whitepapers/latest/aws-overview/six-advantages-of-cloud-computing.html https://aws.amazon.com/blogs/apn/the-5-pillars-of-the-aws-well-architected-framework/

**An enterprise using AWS wants to provide to its billing department a detailed breakdown of the costs and usage of various services. They want the report in a CSV file for the month to the current date so they can analyze the data within Microsoft Excel.Which AWS Billing service would meet this requirement?**

* **AWS Cost and Usage Reports**

The AWS Cost and Usage Reports (AWS CUR) contains the most comprehensive set of cost and usage data available. You can use Cost and Usage Reports to publish your AWS billing reports to an Amazon Simple Storage Service (Amazon S3) bucket that you own. You can receive reports that break down your costs by the hour, day, or month, by product or product resource, or by tags that you define yourself. AWS updates the report in your bucket once a day in comma-separated value (CSV) format. You can view the reports using spreadsheet software such as Microsoft Excel or Apache OpenOffice Calc, or access them from an application using the Amazon S3 API.

Each update in a given month is cumulative, so each version of the Cost and Usage Reports includes all of the billing data for the month to date. The reports generated throughout the month are estimated and subject to change during the rest of the month as you continue to use your AWS services. Different AWS services provide your usage-based billing information at different times, so you may notice updates to a certain hour or day come in at different times. AWS finalizes the Cost and Usage Report's usage charges at the end of the month after an invoice has been issued for your usage charges.

https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html

* AWS Pricing Calculator

* AWS Budgets

* AWS Cost Explorer


**Which AWS security services allow you to apply a set of security controls?**

* **AWS Config**

AWS Config has conformance packs

https://docs.aws.amazon.com/config/latest/developerguide/conformancepack-sample-templates.html

https://docs.aws.amazon.com/config/latest/developerguide/conformance-packs.html

* **AWS Security Hub**

AWS Security Hub consumes, aggregates, and analyzes security findings from various supported AWS and third-party products.

Security Hub provides controls for the following standards.

CIS AWS Foundations
Payment Card Industry Data Security Standard (PCI DSS)
AWS Foundational Security Best Practices
These are basically managed AWS Config Conformance packs since the controls are just AWS Config Rules

* AWS Mananged Rules

AWS WAF has Managed Rules, but these are not security controls but Firewall rules.

* AWS GuardRails

No such service but would be a very good name.

**Which of the following best describes the AWS Cloud benefit of Scalability?**

* A company can launch copies of its application anywhere in the world within minutes.

Global Reach is the ability to make your service or product available anywhere in the world.

* **A company offers an application or system that can adapt to the increase in demand over time.**

Successful, growing, systems often see an increase in demand over time. A system that is scalable can adapt to meet this new level of demand.

https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.concept.scalability.en.html

Scalability is when a cloud service or application can increase the capacity at any time.

So for example with EC2 instances you can scale horizontally (add identical size servers) or vertically scale (increase the size of a single server)

Scalability does not emphasize that it happens automatically and does not take into accounts shrinking capacity when the demand decreases.

* A company's application will have a guaranteed uptime anywhere in Noth America even in the chance of a single region failing.

High Availability (HA) is when your cloud service or app remains available. HA is focused on uptime and operational performance.

uptime - does this service remain available if an AWS Availability Zone or AWS Region becomes unavailable due to a technical issue, or unforeseen disaster

operational performance - how fast can users access the service. Is it slow to the point that the service is not useful?

High Availability is commonly confused with Disaster Recovery and Fault Torlance since HA has overlapping responsibilities.

* A company application can right size (provision instances to match workloads)

Right sizing is the process of matching instance types and sizes to your workload performance and capacity requirements at the lowest possible cost. It’s also the process of looking at deployed instances and identifying opportunities to eliminate or downsize without compromising capacity or other requirements, which results in lower costs.

Right Sizing

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

**What is the recommended measure for protecting your root account?**

* **MFA**

This is true. You should turn on multi-factor authentication for your root account

* Rotate secret keys

An Access Key contains but a Key and Secret. The recommendation is not use Access Keys at all with your root account

* Principle of Least Privledge

A root account by design has full access to everything. You cannot apply Least Privledge. You simply have to not use your root account.

* **Delete all access keys**

This is true, you should never use access keys for your root account.

* Write down your password on paper and store it in a vault

**A company has an existing web application running on AWS Cloud within North America. The company has observed an increase of users from Asia however due to the distance between the customer and the North American these users are experiencing severe latency. The company decides to launch an identical server within an Asia Region to reduce the latency.Which benefit of AWS Cloud does this best describe?**

* Economy of scale

* Agility

* **Global Reach**

Global Reach is about being able to provide better operational performance to new or existing but underserved geographical areas.

Go global in minutes – Easily deploy your application in multiple regions around the world with just a few clicks. This means you can provide lower latency and a better experience for your customers at a minimal cost.

* High Availability

Since the question is asking about serving a customer in a different region far from the current region the crux of the question is global availability.

If you guessed High Availability, that's understandable because it's technically valid, but Global Reach is more valid of an answer.

High Availability (HA) is when your cloud service or app remains available. HA is focused on uptime and operational performance.

uptime - does this service remain available if an AWS Availability Zone or AWS Region becomes unavailable due to a technical issue, or unforeseen disaster

operational performance - how fast can users access the service. Is it slow to the point that the service is not useful?

High Availability is commonly confused with Disaster Recovery and Fault Torlance since HA has overlapping responsibilities.

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

**An organization wants to download a compliance report to attest that AWS meets regulatory compliance before they decide to adopt AWS as their primary cloud service provider.Which AWS service will meet this requirement?**

* Amazon Regulatory Reporter

There is no such service

* **AWS Artifact**

AWS Artifact is your go-to, central resource for compliance-related information that matters to you. It provides on-demand access to AWS’ security and compliance reports and select online agreements. Reports available in AWS Artifact include our Service Organization Control (SOC) reports, Payment Card Industry (PCI) reports, and certifications from accreditation bodies across geographies and compliance verticals that validate the implementation and operating effectiveness of AWS security controls. Agreements available in AWS Artifact include the Business Associate Addendum (BAA) and the Nondisclosure Agreement (NDA).

https://aws.amazon.com/artifact/

* Amazon Inspector

Amazon Inspector is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS. Amazon Inspector automatically assesses applications for exposure, vulnerabilities, and deviations from best practices. After performing an assessment, Amazon Inspector produces a detailed list of security findings prioritized by level of severity. These findings can be reviewed directly or as part of detailed assessment reports which are available via the Amazon Inspector console or API.

https://aws.amazon.com/inspector/

* AWS Customer Compliance Center

The AWS Customer Compliance Center is a marketing page.

https://aws.amazon.com/compliance/customer-center/

**A company needs to run batch jobs a few times throughout the year.These jobs can be interrupted and resumed with no impact on the business.Which instance EC2 Pricing Model is the most cost-effective option?**

* Dedicated Hosts

* Reserved

* **Spot**

Spot Instances is Ec2 compute that you can bid to use at a discount. Spot instances can be interrupted at any time for priority customers.

If you can handle an interruption to your service, or can carry on computational workload from where you last left off or from the start than Spot is ideal.

https://aws.amazon.com/ec2/spot/?cards.sort-by=item.additionalFields.startDateTime&cards.sort-order=asc https://aws.amazon.com/ec2/faqs/#Spot_instances

* On-Demand


**Which of the following Compliance certifications attests to the security of the AWS platform regarding credit card transactions?**

* SOC 2

AWS System and Organization Controls (SOC) Reports are independent third-party examination reports that demonstrate how AWS achieves key compliance controls and objectives. The purpose of these reports is to help you and your auditors understand the AWS controls established to support operations and compliance.

SOC 2 is an auditing procedure that ensures your service providers securely manage your data to protect the interests of your organization and the privacy of its clients.

https://aws.amazon.com/compliance/soc-faqs/

* **PCI DSS Level 1**

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

**What best describes the Principle of Least Privilege (PoLP)?**

* **Users should be granted permission to access only specific resource actions to accomplish their tasks.**

The principle means giving a user account only those privileges which are essential to perform its intended function.

For example, a user account for the sole purpose of creating backups does not need to install the software: hence,

it has rights only to run backup and backup-related applications

https://en.wikipedia.org/wiki/Principle_of_least_privilege

* Users should always have a little more access granted to them then they need, just in case they end up needed it in the future.

* Users should submit all access requests in written form so that there is a paper trail of who needs access to different AWS resources.

* All users should have the same baseline permissions granted to them to use basic AWS services.

**In order to use CloudWatch Alarms to monitor Billing information, what two things must you do?**

* **Create a Billing Alarm**

* Create an AWS Budget

AWS Budget likely uses Billing Alarms underneath but they are managed by AWS. The question is about using a Billing Alarm directly.

* Enable Cost and Usage Reports

Cost and Usage Reports does not relate to Billing Alarms

* **Enable Billing Alerts**

Before you can create an alarm for your estimated charges, you must enable billing alerts, so that you can monitor your estimated AWS charges and create an alarm using billing metric data. After you enable billing alerts, you can't disable data collection, but you can delete any billing alarms that you created.

After you enable billing alerts for the first time, it takes about 15 minutes before you can view billing data and set billing alarms.

* Create an AWS Cost and Usage Report

Cost and Usage Reports does not relate to Billing Alarms

EXPLANATION
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html#turning_on_billing_metrics

You can monitor your estimated AWS charges by using Amazon CloudWatch. When you enable the monitoring of estimated charges for your AWS account, the estimated charges are calculated and sent several times daily to CloudWatch as metric data.

Billing metric data is stored in the US East (N. Virginia) Region and represents worldwide charges. This data includes the estimated charges for every service in AWS that you use, in addition to the estimated overall total of your AWS charges.

The alarm triggers when your account billing exceeds the threshold you specify. It triggers only when actual billing exceeds the threshold. It doesn't use projections based on your usage so far in the month.

If you create a billing alarm at a time when your charges have already exceeded the threshold, the alarm goes to the ALARM state immediately.

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html

**A company wants to run a development environment for their web application which is backed by the relational database Postgres.Which AWS service would best meet their requirements?**

* Amazon Aurora

You can use Amazon Aurora but it's expensive and intended for production workloads.

* AWS Postgres

There is no such service name AWS Postgres

* DynamoDB

DynamoDB is a NoSQL database

* **RDS**

Amazon Relational Database Service (RDS) supports Postgres engines and is suited for both development and production workloads.

It works well for development workloads since you can choose a free-tier instance type and choose to opt-out of costly features like Multi-AZ


**What are three key factors from the twelve-factor app pattern methodology that play a role in designing for failure?**

* Events Streams

Made this up.

* **Logs**

Logs (treat logs as event streams) – If part of a system fails, troubleshooting is necessary. Ensure that material for forensics exists.

* Breakability

Made this up.

* **Disposability**

Disposability (maximize robustness with fast startup and graceful shutdown) – Produce lean container images and strive for processes that can start and stop in a matter of seconds.

* **Dev/prod parity**

Dev/prod parity – Keep development, staging, and production as similar as possible.

EXPLANATION
“Everything fails all the time.” – Werner Vogels

https://docs.aws.amazon.com/whitepapers/latest/running-containerized-microservices/design-for-failure.html https://12factor.net/

**A company has three different versions of their web application running in a single AWS account. Each version has wildly different architectures and must remain running due to legacy multi-year licensing agreements.The company wants to isolate the combined cost of each version of their web application's infrastructure.Which AWS billing feature or service would meet this requirement?**

* AWS Cost Explorer

AWS Cost Explorer would be used alongside Cost Allocation Tags to isolate the pricing.

Cost Allocation Tags or tags in general is functionality that allows you to isolate the cost of a group of services.

* **Cost Allocation Tags**

You can tag resources. You can use AWS Cloud Explorer to view the cost of those tags.

A tag is a label that you or AWS assigns to an AWS resource. Each tag consists of a key and a value. For each resource, each tag key must be unique, and each tag key can have only one value. You can use tags to organize your resources, and cost allocation tags to track your AWS costs on a detailed level. After you activate cost allocation tags, AWS uses the cost allocation tags to organize your resource costs on your cost allocation report, to make it easier for you to categorize and track your AWS costs. AWS provides two types of cost allocation tags, an AWS generated tags and user-defined tags. AWS, or AWS Marketplace ISV defines, creates, and applies the AWS generated tags for you, and you define, create, and apply user-defined tags. You must activate both types of tags separately before they can appear in Cost Explorer or on a cost allocation report.

https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html

* AWS Cost and Usage Reports

* AWS Budgets

**A Billing Administrator has been asked to forecast the combined costs of RDS and EC2 instances running in the production AWS account for the next three months.The Billing Administrator may need to create an adjustment to the forecast multiple times throughout the month and compile it as a report for the CFO.Which AWS Billing service will meet these requirements?**

* **AWS Cost Explorer**

Cost Explorer has powerful Forecasting tooling You can download the report and a CSV.

Cost Explorer is very good for speculative forecasting

https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-modify.html#ce-timerange

* AWS Budgets

AWS Budgets can do forecasting. It's more intended to be used as a way to alert you when you pass a forecasted threshold than to do speculative forecasting

* AWS Cost and Usage Reports

You can download a CSV But you would have to do your own forecasting. We want an AWS tool that will automatically forecast for us and then download the CSV

* AWS Forecast

This is a time-series database. It's not specifically for forecasting AWS billing.

https://aws.amazon.com/forecast/

**An AWS customer believes that one of their accounts has been comprised and it has resources running compute workloads performing illegal activities.What action should the AWS customer take?**

* AWS Technical Support

AWS does have paid technical support, Technical support will simply redirect you to the AWS Abuse.

* AWS Account Support

AWS provides billing and account support for all tiers of support. For abuse cases, they have a specialized team called AWS Trust & Safety.

* AWS Access Analyzer

IAM Access Analyzer helps you identify the resources in your organization and accounts, such as Amazon S3 buckets or IAM roles, shared with an external entity. This lets you identify unintended access to your resources and data, which is a security risk.

It's not intended for reporting abuse cases.

https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html

* **Contact abuse@amazonaws.com**

If you suspect that AWS resources are used for abusive purposes, contact the AWS Trust & Safety team using the Report Amazon AWS abuse form, or by contacting abuse@amazonaws.com. Provide all the necessary information, including logs in plaintext, email headers, and so on, when you submit your request.

https://aws.amazon.com/premiumsupport/knowledge-center/report-aws-abuse/

**A company is planning to migrate their virtual machines from on-premise to AWS.The company wants to take advantage of EC2 Auto Scaling, which will allow them to programmatically and automatically add or remove servers to meet the demand at any given time.Which benefit of cloud computing best describes this scenario?**

* Agility

Agility is how quickly your developers can build and iterate on a product with cloud technology.

Agility is commonly confused with Global Reach because the Six Advantages of Cloud Computing has " go global in minutes" and the "in minutes" part you might attribute to agility, which is technically true, but that Advantage is more focused on Global Reach, being able to launch your service anywhere with little to no fricition.

* **Elasticity**

SELECTED
Elasticity is the ability to add or remove servers automatically based on rules or metrics such as CPU, Network IN, Memory and more.

Elasticity is not exclusive to Virtual Machines, and sometimes Elasticity is built-in like serverless services so it's abstracted away.

Elasticity means that your resources will automatically be right-sized for the emerging capacity requirements.

* Economy of scale

Economy of scale is when you share the cost with other customers.

AWS has a data center full of physical servers, and customers are running on the same hardware but virtually isolated via Virtual Machines (VMs). A customer that shares hardware with other customers is known as "multi-tenancy". Think of an apartment building that has multiple tenants.

* High Availability

High Availability (HA) is when your cloud service or app remains available. HA is focused on uptime and operational performance.

uptime - does this service remain available if an AWS Availability Zone or AWS Region becomes unavailable due to a technical issue, or unforeseen disaster

operational performance - how fast can users access the service. Is it slow to the point that the service is not useful?

High Availability is commonly confused with Disaster Recovery and Fault Torlance since HA has overlapping responsibilities.

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

**An organization is migrating their Microsoft SQL Server to AWS Cloud however they have already purchased a software licence from Microsoft for their SQL Server. The license does not include Software Assurances.Is it possible for an organization to Bring-Your-Own-License (BYOL) to AWS and how would they achieve this?**

* Amazon Relational Database Service (RDS) via AWS License Manager

You can run a SQL Server Engine on RDS. AWS License Manager does support RDS. However this specific use case does require a Dedicated EC2 instance

Q: Which AWS services are supported through AWS License Manager?

A: AWS License Manager supports Amazon EC2, Amazon Relational Database Service (Amazon RDS), AWS Marketplace, and AWS Systems Manager (includes support for on-premises environments and AWS cloud). You can use AWS License Manager to track licenses across your EC2 instances using default tenancy, Dedicated Instances, Dedicated Hosts, Spot instances, Spot Fleet, and Auto Scaling groups.

https://aws.amazon.com/license-manager/faqs/

* **Dedicated EC2 Server integrated with AWS License Manager**

Bring existing licenses to Dedicated Hosts

Amazon EC2 offers Dedicated Hosts, which allow you to access hardware that's fully dedicated for your use. You can use your own licensed software on dedicated infrastructure, even without Software Assurance. For more information on bringing licenses without Software Assurance or License Mobility benefits, please visit this section of the FAQ.

Amazon EC2 Dedicated Host is also integrated with AWS License Manager, a service which helps you manage your software licenses, including Windows Server and SQL Server licenses. In License Manager, you can specify your licensing terms for governing license usage, and easily track licenses for compliance and auditing. You can also specify Dedicated Host management preferences for host allocation and host capacity utilization. Once setup, AWS takes care of these administrative tasks on your behalf, so that you can seamlessly launch virtual machines (instances) on Dedicated Hosts just like you would launch an EC2 instance with AWS-provided licenses.

Eligible Products

Microsoft software covered by the Microsoft Product Terms can be deployed on AWS using Amazon EC2 Dedicated Hosts. Examples include:

Microsoft Windows Server
Microsoft SQL Server
Microsoft Remote Desktop Services (user CALs)
Microsoft Exchange Server
Microsoft SharePoint Server
Microsoft System Center
Microsoft Dynamics products
https://aws.amazon.com/windows/resources/licensing/

* Import your licence via AWS License Manager, Use any compute you like

AWS License Manager does not support all computing services.

EXPLANATION
Understand the impact of software licensing costs when moving to the cloud.

This similar question appeared on the exam, This question was much more difficult than other questions which is why we provided a similarly difficult question.

https://aws.amazon.com/windows/resources/licensing/

https://www.microsoft.com/en-us/licensing/licensing-programs/software-assurance-default

**An organization has many departments that run their own AWS accounts. There is a concern that some S3 buckets might be publically visible which could result in a data leak.Which AWS security service can detect for publicly facing S3 buckets?**

* Amazon Detector

There is a service called Amazon Fraud Detector There is no service called Amazon Detector

* Amazon GuardDuty

Amazon GuardDuty is a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts, workloads, and data stored in Amazon S3. With the cloud, the collection and aggregation of account and network activities are simplified, but it can be time-consuming for security teams to continuously analyze event log data for potential threats.

* **Amazon Macie**

Macie automatically and continually evaluates all of your S3 buckets and alerts you to any unencrypted buckets, publicly accessible buckets, or buckets shared with AWS accounts outside those you have defined in the AWS Organizations.

https://aws.amazon.com/macie/

* **AWS IAM Access Analyzer**

AWS IAM Access Analyzer helps you identify the resources in your organization and accounts, such as Amazon S3 buckets or IAM roles, shared with an external entity. This lets you identify unintended access to your resources and data, which is a security risk. Access Analyzer identifies resources shared with external principals by using logic-based reasoning to analyze the resource-based policies in your AWS environment.

https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html

S3 Bucket Scanner

There is no such feature for S3

**Which AWS service is used to calculate the Total Cost of Ownership?**

* TCO Calculator

This was a thing, but AWS replaced it with the AWS Pricing Calculator

https://aws.amazon.com/blogs/aws/new-cloud-tco-comparison-calculator-for-web-applications/

* AWS Budgets

AWS Budgets allows you to set custom budgets to track your cost and usage from the simplest to the most complex use cases. With AWS Budgets, you can choose to be alerted by email or SNS notification when actual or forecasted cost and usage exceed your budget threshold, or when your actual RI and Savings Plans' utilization or coverage drops below your desired threshold.

* AWS Cost Explorer

AWS Cost Explorer has an easy-to-use interface that lets you visualize, understand, and manage your AWS costs and usage over time.

* **AWS Pricing Calculator**

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

**An organization wants to ensure the files that it stores in S3 are secure at rest.What functionality would provide this security?**

* **Server-Side Encryption**

Server-side encryption protects data at rest. Amazon S3 encrypts each object with a unique key. As an additional safeguard, it encrypts the key itself with a key that it rotates regularly. Amazon S3 server-side encryption uses one of the strongest block ciphers available to encrypt your data, 256-bit Advanced Encryption Standard (AES-256).

https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingServerSideEncryption.html

* Client-Side Encryption

Client-Side Encryption is the action of encrypting data before sending it to S3. This is for encryption in transit.

https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingClientSideEncryption.html

* Presigned URLs

Presigned URLs allow you to generate temporary URLs to access private files.

https://docs.aws.amazon.com/AmazonS3/latest/userguide/ShareObjectPreSignedURL.html

* Infrequent Access

S3 Infrequent Access is an access tier that can reduce the cost of storage but is not applicable to security.

https://aws.amazon.com/s3/storage-classes/

**A company is evaluating whether to move its workloads to AWS Cloud from on-premise.The Chief Executive Officer wants to understand how moving to AWS will impact their IT team that currently manages their on-premise infrastructure.What will happen to the IT team?**

* AWS does not manage the underlying infrastructure, your IT Team will work with AWS IT teams directly to provide the physical infrastructure needed to run your cloud workloads.

This is untrue, AWS takes care of a lot of the underlying infrastructure, but not all of it and it varies based on the service offering.

* The company's IT team will need to be let go. AWS will take care of the underlying infrastructure and the underlying infrastructure in most cases is not accessible or is abstracted away from the AWS customers.

AWS is not responsible for all the cloud infrastructure.

The Shared Responsibility Model lists that both the Customer and AWS are responsible

https://aws.amazon.com/compliance/shared-responsibility-model/

The data centers, hardware, and physical network and global infrastructure is AWS's responsibility.

AWS has different levels of offerings where you can deploy bare-metal, have an onsite rack of computers running AWS services, or serverless compute where the developers are only responsible for uploading individual functions of code.

* **The IT team will have utility elsewhere and ideally, you'll shift them to revenue-generating activities.**

Reducing your IT Team is a possibility but not for the entire team.

The IT team can be shifted away from managing infrastructure to revenue-generating activities.

SELECTED
AWS manages the data centers, physical hardware, physical network, global infrastructure and fully managed services so your IT will be freed up to focus on revenue-generating activities.

EXPLANATION
This is question is for: - Explain how the AWS cloud allows users to focus on business value - Shifting technical resources to revenue-generating activities as opposed to managing infrastructure

https://aws.amazon.com/economics/

We never encountered this question in the exam, but it's in the exam guide.

