# What is this?

This is an abstract implementation of a chat system where it has three entities: *Inbox, Conversation, and Message*

Routing

 ```bash
  localhost:3000/inboxes
  localhost:3000/inboxes/SOME_TOKEN/conversations
  localhost:3000/inboxes/SOME_TOKEN/conversations/SOME_NUMBER/messages
  localhost:3000/inboxes/SOME_TOKEN/conversations/SOME_NUMBER/messages/serach/SOME_WORD
``` 


# How to Run?

This README would normally document whatever steps are necessary to get the
application up and running.

All you need to run this is

* Set MYSQL_ROOT_PASSWORD to whatever you'd like both in the web service and db service

* And then ```docker-compose up``` 

## Things to consider

* DB commands like ```rake db:create, rails db:migrate, rails db:seed``` are ran automatically
* DB will contain a random seed at startup
* DB is stateless, if the whole stack is restarted, all stored data will be gone