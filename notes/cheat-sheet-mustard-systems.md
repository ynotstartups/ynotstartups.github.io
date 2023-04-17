# Cheat Sheet Mustard Systems

**Q: Link to job description?**

https://www.mustardsystems.com/senior-software-developer.html

**Q: What does the company do**

- a small statistical consultancy company specialising in the modelling of sporting events
- predict sport as accurately as possible by combining large, rapidly changing datasets with home grown software and statistical models
- internal trading

**Q: How many people**

45

quants, software engineers, linux infrastructure engineer

**Q: What is the tech stack**

Python, Go for infrastructure services, Linux servers, PostgreSQL,
ZeroMQ and RabbitMQ for backend communication, jQuery, React and vue.js for the frontend

*infrastructure*

Linux systems (primarily Ubuntu, some CentOS),
LXC containers,
FreeIPA, Active Directory, bind and dnsmasq,
Ansible configuration management,
PostgreSQL and MySQL databases,
OpenVPN, VyOS and HPE networking,
Ubuntu Linux and Windows desktops,
Google Workspace and Office365,
On-prem hardware & some cloud mixed in

```mermaid
graph LR
    Golf[Golf Data] --> Feed[(Feed: Time Series Postgres DB, ZeroMQ and RabbitMQ)]
    Cricket[Cricket Data] --> Feed
    OtherSport[Other Sport Data] --> Feed
    subgraph Infras[Go for infrastructure services with Linux servers]
        Feed --> UI[Python BE MySQL with JQuery, React, Vue.js UI]
    end
    UI --> Quants
    UI --> Traders
    UI --> DataScientists
```

**Q: What is the name and responsibility of role?**

name: Senior software engineer
responsibility:

- Collaborated with Traders and Quants to analyze solutions based on company and client requirements

**Q: What is culture like in the company?**

fast-paced, ever-changing environment, offering fresh challenges

**Q: Look for software engineer job description for employees in Linkedin**

*Junior*

- Collaborated directly with Traders and Quants to analyze solutions based on company and client requirements.
- Working under pressure to implement numerous hotfixes on production environments between agile sprints.
- Often tasked with ensuring smooth staging and production deployments.
- Consulted with infrastructure team members to determine system loads, monitoring and improvement plans.

Skills: Python (Programming Language) · MySQL · Git · Object-Oriented Programming (OOP)

*Senior*

- technical lead for the team responsible for ingesting our data streams and presenting them in a usable format for other teams, this includes both making them available in real time and persisting them in a time-series database for after the fact analysis. The main technical challenges relate to reliable and efficient entity identification, maximizing throughput and minimizing latency, and presenting the data in an easily retrievable fashion.

Previously, I was the technical lead for a team also responsible for the auto-trader, price feed and position management systems. The new projects that my current team manages grew large enough, and we split that team into two one being my current team. During my time working on those projects, they increased significantly in reliability, performance, observability and scalability.

Alongside the directly technical responsibilities, I also mentor members of my team and do some project management to ensure we are working on the correct things in the correct order.

skills: RabbitMQ · Go (Programming Language) · PostgreSQL · Linux · Python (Programming Language)

**Q: What is future of the company?**

Our ambitions are high, aiming to create best-in-class systems in a highly competitive field.

## Prepare for questions

Q: You will have the opportunity to explore your own ideas and suggest new tools. Should we parse input data using something from the standard library? Would we be better off using a third party tool like ANTLR or Ragel? Could we use regular expressions, or would that just give us two problems? Would a quick sed script get the job done? Is the best solution to store output data in a relational database? Would a NoSQL store be a better fit for this problem, or could we use something hierarchical like HDF5? The answer will vary depending on the problem and you’ll be expected to investigate the options to find a good solution.

- parse input data with standard library, ANTLR or Ragel:

  - ANTLR: parsers and parser generators, parser generator that you can use to read, process, execute, or translate structured text such as program source code, data, and configuration files
  - Ragel:
  - regular expressions, or would that just give us two problems?
    - What is the two problems?
  - sed

- Is the best solution to store output data in a relational database? Would a NoSQL store be a better fit for this problem, or could we use something hierarchical like HDF5?

  - relational database v.s. NoSQL v.s. HDF5?

**Q: what interests you about the company?**
**Q: what makes you a good fit for the company?**

- **small and strong team, smart people**
  - being about to have a impact in the company by working directly with infrastructure team, traders and quants. In my previous role, I am building app for general public, external users, which I always feel a distance with the users, I wish I can talk directly with the users and get feedbacks from them.
- **expanding to other sports and scaling up price feed infra**
- **statistically oriented**
  - statistic is my favourite subject during my bachelor at UCL
  - my bachelor dissertation is in statistics, it's about transforming the UK map based on traveling time using train instead of geological distance
- **distrust of microsoft and apple**, linux, being able to use ubuntu in the job? and
  - I am a linux nerd, vim, ubuntu, i3 window manager, my dot files are in git
  - chance to learn Go
- **Pragmatism**

**Q: What is the interview process?**

- programming test
- call with cofounder
- call with tech leads about the role

## Questions

**Related to the role**

- reading the tech stack, there is no mention of cloud provider such as aws? is the tech stack hosted on premise?
  - can you tell me a bit about the CI/CD pipeline?
- What is your most and least favourite part about the tech stack?
- Which team will I work in? What are the responsibilities of the team?
- Can you describe a typical projects that I will be involved in?

**Related to company**

- What is income structure of the company? (cannot answer from job description)
  - is it primarily by the success of traders or external consultant commission?
  - auto trader v.s. trader
- What is the culture like? What is the relationship between trades, quants and developers?
- How does covid impacted the company? both during and after the covid? What are the learnings?
- Would the company stay like a small consultancy or would it grow to a medium to large company? Why?
- How would you pitch your team to convince me to join your team?
- What makes the company competitive in the field? What are the killer features?
- What is the relationship with gambit research?

## Reply

- not cut-throat, rather, it's a relax enviroment, not much overtime
- ideas got heard as team is small
- plenty of social events, organised sport's tournaments
- quants in the same team, working together
- there are two sports, cricket & golf