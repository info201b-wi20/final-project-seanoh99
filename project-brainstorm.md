# Project Brainstorm
Group Members: Chris Lee, Andrew Hsu, Michael Sun, Sean Oh
[GitHub Repo](https://github.com/info201b-wi20/final-project-seanoh99)

## What is our domain?
Facebook and Political Advertising

## Why are we interested?
With the rise of big data analytics companies are spending more and more money
on advertising. This is because ads are now more influential than ever,
combining psychological research with vast personal data. One of the most
concerning things about this trend is its application in political advertising.
In our last election cycle, Facebook was taken to court over its role in
influencing the election. The ads were claimed to be so influential that they
decided the outcome of the election as a whole. It would be interesting to
study Facebook ads and political ads on an aggregate scale where we can
hopefully generate some insights and reach a new understanding of this problem.

## Other data-driven projects
- [Political Advertising and Election Results](https://www.kellogg.northwestern.edu/faculty/spenkuch/research/advertising.pdf)
  - They are interested in the persuasive effects of political advertising on the
    outcomes of the election. They analyze the data from Campaign Media Analysis
    Group (CMAG), and the Wesleyan Media and Wisconsin Advertising. The results
    suggest there is no impact on the aggregate turnout, but a positive and
    economical effect on the vote share.


- [Mad Money: TV ads in the 2012 presidential campaign](https://www.washingtonpost.com/wp-srv/special/politics/track-presidential-campaign-ads-2012/)
  - This article focuses on the ad spending by state in the 2012 presidential
    campaign. It indicates that most of the money is spent on negative ads aimed at
    converting voters to their side. They present the data by using a statistical
    map.


- [Ad Delivery Algorithms: The Hidden Arbiters of Political Messaging](https://arxiv.org/pdf/1912.04255.pdf)
  - This paper grapples with the consequences of facebook’s practices in
    political ad delivery, and aims to determine whether Facebook skews
    distribution of their political ads to individuals that are expected to
    already agree with the featured candidates based on their own ethnic and
    gender identities.

## Questions we want to answer
- _Who pays for the ads?_
  - We can find this by aggregating the "paid_for_by" category in the "Political
Advertisements From Facebook" data set and doing some simple analysis


- _Who are the targets of the ads?_
  - We can find this by aggregating the "targeting" category in the "Political
Advertisements From Facebook" data set and doing some simple analysis


- _How many ads are political?_
  - We can get a good estimate of this by combining the political probability
  with the number of tagged political ads in the "Political Advertisements
From Facebook" data set. We would also use the "Facebook Ad Categories" dataset
to figure out the proportion as well as the raw number.


- _How effective are the ads?_
  - This would be a good more challenging question to answer but would be
  interesting to explore. Some initial ideas are comparing the most commission
  subject of the datasets to recent polls and election results and looking
  for correlations.

## Our data
### Facebook Ad Categories
- _Where did you download the data (e.g., a web URL)?_
  - https://www.propublica.org/datastore/dataset/facebook-ad-categories


- _How was the data collected or generated? Make sure to explain who collected_
  - the data (not necessarily the same people that host the data), and who or
what the data is about?_
Data for this dataset was compiled using a Chrome extension, built by
ProPublica reporters, in which the extension showed users the interest
categories Facebook assigned to them, and gave users the opportunity to
share all of these categories with ProPublica


- _How many observations (rows) are in your data?_
  - 52235


- _How many features (columns) are in the data?_
  - 7


- _What questions (from above) can be answered using the data in this dataset?_
  - What proportion of ads are political?

### Political Advertisements From Facebook
- _Where did you download the data (e.g., a web URL)?_
  - https://www.propublica.org/datastore/dataset/political-advertisements-from-facebook


- _How was the data collected or generated? Make sure to explain who collected
the data (not necessarily the same people that host the data), and who or what
the data is about?_
  - The data is collected by browser extensions that ProPublica users install. These extensions automatically send information on Facebook ads they come across to ProPublica’s database.


- _How many observations (rows) are in your data?_
  - sadf


- _How many features (columns) are in the data?_
  - 23


- _What questions (from above) can be answered using the data in this dataset?_
  - How many political ads were seen?
  - Who paid for the ads?
