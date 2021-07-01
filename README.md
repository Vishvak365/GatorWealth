# GatorWealth
## Inspiration
As college students, we are surrounded by technology everywhere we go. We also are starting to have more and more financial responsibilities and technology could help with that. However, with the apps out in the market, the over complications of apps make reviewing financial data a daunting task. Our goal is to improve financial literacy across our campus.

## What it does
This app merges one individual’s personal finances into one location, so that users can see an overview of all their important financial information in one place. It is separated into a spending and savings tab. In the spending tab, users can see recent transactions from all of their accounts and their total spending over a given period of time. In the savings tab, users can see all of their financial assets from all of their accounts, and each respective balance.

## How we built it
We used Flutter by Google for this app. Flutter allowed us to create a beautiful material app with both Dark Mode and Light Mode (that automatically changes based on the user’s phone) in record time. Ease of use was something that was important to us to make sure that users of all age groups can use the app and actually understand their financial situation. The local college community would greatly benefit from this app because the Plaid API allows for access to a user’s transactions through a security-focus API. We were able to easily get various transactions and display them in an appealing way. Users are also able to do a quick search of their transactions.

This app used a combination of node.js and express.js to interact with our MongoDB database. The database securely stores user information by hashing and salting the password, and from there is able to access any information stored by that user under their respective account. Transaction and personal balance information were queried by their categories to be able to display financial information on the front end.

## Challenges we ran into
Integrating the API that we wanted to use was tricky on the back-end, so we decided to use sample data provided instead for the time being. However, with this data, we were able to create an API around it so that the front-end can access the Plaid Data. We wanted to prioritize functionality, and we plan to integrate the real-time API data in the future.

## Accomplishments that we're proud of
Some of the biggest accomplishments of the team were the use of secure login platform, well designed front-end components with emphasis on user experience, incorporation of dark theme throughout the app, and retrieving data from the database to display on the app.

## What we learned
We gained experience in utilizing Flutter to develop the front-end components of a cross-platform mobile application, and using HTTP requests with the cloud database to fetch user and financial information.

## What's next for GatorWealth Financial Planner
We want to integrate the financial data API that we wanted to use so that users can get real-time data about their finances. We also wanted to create graphs so users can visualize their spending by categories and over time. Another major feature that we wanted to incorporate, but were unable to in the time given, was subscription management so that users can distinguish day-to-day costs from recurring costs. This way, users would be able to see any subscriptions or recurring costs that they may have forgotten about. We wanted to either user input or machine learning algorithms to identify/predict which transactions were repeated over time. Also, in the savings section of the app, we were planning on introducing a “piggy bank” tab that would allow users to save a certain percentage of their income towards a wishlist item.
