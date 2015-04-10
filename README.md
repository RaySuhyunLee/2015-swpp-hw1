# SWPP HW 1

## Student
2013-11419 이수현 Suhyun Lee

## Github
https://github.com/RaySuhyunLee/2015-swpp-hw1

## Back-End API
http://raysuhyunlee.net:3000/

`login`: [POST] http://raysuhyunlee.net:3000/login

`signup`: [POST] http://raysuhyunlee.net:3000/signup

`clearData`: [POST] http://raysuhyunlee.net:3000/clearData

## Back-End Instruction
You can clone it and run 'blog/bin/rails server directly.
This counter server uses only one controller named `index`, for login counting. It's located in app/controllers/index_controller.rb
The model that stores the user account data is named `user_account`. The location of files concerned with it follows Rails' convention.
Since it uses the session to know if user has already logged in, you should logout before another login.

## Front-End Instruction
There are two views in this program - `index.html.erb` and `logged.html.erb`. Both of them are implemented in the index controller.
There are one coffeescript file used within the index controller - `index.js.coffee`  

All front-end files are located along with Rails' convention.
For example, all the view files are located in app/views/index/ and the coffeescript file is located in app/assets/javascript/index.js.coffee

## Comments
There exists a controller named `data` in this project directory. It was only used for debugging and testing, thus it has nothing with this assignment and you can ignore it.

## Design(CSS) Rererence
http://designsparkle.com/login-form-templates/
