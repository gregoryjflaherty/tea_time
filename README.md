<div align="center">


# TEA TIME
![okay-tea-cup-character-cartoon-vector-19912664](https://user-images.githubusercontent.com/87443686/173124115-cf67e4b8-ba8b-41a0-950f-904d2344549f.jpeg)

![rails-badge](https://img.shields.io/badge/Rails-7.1.0-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.4-informational?style=flat-square) [![Coverage](https://marcgrimme.github.io/simplecov-small-badge/badges/coverage_badge_total.svg)](#testing)![closed-pr-badge](https://img.shields.io/github/issues-pr-closed-raw/gregoryjflaherty/tea_time?style=flat-square)

# Table of Contents
[About this App](#about-this-app)<br><br>
[Endpoints](#endpoints)<br><br>
[Testing](#testing)<br><br>
[Database Schema](#database-schema)<br><br>
[Contributor](#contributor)<br><br>
  

# About this App
  
 This application is meant to be used in conjunction with a FE application. Endpoints can also be called via [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://learning.postman.com/docs/getting-started/introduction/)

This application requires a customer to be logged in to successful engage with any of the applications endpoints. Upon passing authentication and being authorized, a customer can create a new subscription to any tea in the database, update any current subscriptions status and/or frequency, as well as retrieving a list of all subscriptions (active and cancelled)

### To use this application locally following the following steps :
<div align="left">
 1- Fork and clone this repository into your local machine <br><br>
  
 2- Install gems locally:

    $ bundle install

 3- Reset database, seed data:

    $ rails db:{drop,create,migrate} 
 
 4- Start server:

    $ rails s
  
 5- Call endpoints via FE application or via Postman:
  
<div>
<div align="center">

# Endpoints  
  ### Log In 
  ![Screen Shot 2022-06-10 at 2 26 12 PM](https://user-images.githubusercontent.com/87443686/173128076-b89bed71-503d-414d-aa06-11f2b7c823d7.png)
  ![Screen Shot 2022-06-10 at 2 28 50 PM](https://user-images.githubusercontent.com/87443686/173128453-42ff4e73-74ca-4777-8b73-e5ccd3dca23b.png)
  ### Log Out
  ![Screen Shot 2022-06-10 at 2 26 17 PM](https://user-images.githubusercontent.com/87443686/173128166-8253f384-db80-40a1-af55-1f39d67d6e04.png)
  ![Screen Shot 2022-06-10 at 2 28 54 PM](https://user-images.githubusercontent.com/87443686/173128662-68238db9-3248-4058-89bb-f4bb8a9d8904.png)
  ### Create Subscription
  ![Screen Shot 2022-06-10 at 2 26 36 PM](https://user-images.githubusercontent.com/87443686/173128319-24deb288-9ede-4d0e-888e-c2751158cfc7.png)
  ![Screen Shot 2022-06-10 at 2 33 24 PM](https://user-images.githubusercontent.com/87443686/173128951-b1b6b979-7d61-4542-9580-914355bb5603.png)
  ### Update Subscription
  ![Screen Shot 2022-06-10 at 2 35 14 PM](https://user-images.githubusercontent.com/87443686/173129760-30ed6250-01dd-4bdf-8c84-76eabd75638c.png)
  ![Screen Shot 2022-06-10 at 2 34 48 PM](https://user-images.githubusercontent.com/87443686/173129686-20291e63-942c-4a95-af57-915888bd19b5.png)
  ### Get All Subscriptions
  ![Screen Shot 2022-06-10 at 2 38 10 PM](https://user-images.githubusercontent.com/87443686/173129865-058d7bcc-6e17-4938-8183-1f1a0fdc694e.png)
  ![Screen Shot 2022-06-10 at 2 37 36 PM](https://user-images.githubusercontent.com/87443686/173129801-9f7d05fd-636b-4eee-8ab7-6e99bd4a5a55.png)

# Testing
  ### To run this test suite follow the following steps :
<div align="left">
  
 1- From command line run :

    $ bundle exec rspec 
  
  
![Screen Shot 2022-06-10 at 2 43 56 PM](https://user-images.githubusercontent.com/87443686/173130728-0d89a052-5b9f-4714-b809-323788392197.png)

 2- To check coverage run the following (a window with the following will pop up):

    $ open coverage/index.html
 ![Screen Shot 2022-06-10 at 2 43 19 PM](https://user-images.githubusercontent.com/87443686/173130484-4dcb2bed-2dd3-4832-9fb5-88b89ec3a0bb.png)

<div>
  
<div align="center">
 
  
  
# Database Schema
   ![Screen Shot 2022-06-10 at 2 12 17 PM](https://user-images.githubusercontent.com/87443686/173126139-28222e04-f836-48b0-990d-7568e8f4cc66.png)

# Contributor

If any ideas for improvement, any errors are seen, or if you are interested in building something in the future, please feel free to contact me directly via any of the below avenues:<br><br> 
[![Linkedin Badge](https://img.shields.io/badge/-GregFlaherty-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/gregoryjflaherty/)](https://www.linkedin.com/in/gregoryjflaherty/) 
[![Gmail Badge](https://img.shields.io/badge/-gregoryjflaherty@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:gregoryjflaherty@gmail.com)](mailto:gregoryjflaherty@gmail.com)
  
  [![github-readme-twitter](https://github-readme-twitter.gazf.vercel.app/api?id=gregjflaherty)](https://github.com/gazf/github-readme-twitter)
  
# BUILT WITH
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /> <img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white" /> <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" /> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />      
  
#### :gem: Additional Gems :gem:
Fast JSON API |
Faraday |
Shoulda Matchers |
SimpleCov |
<br><br>

<div>
</div>
