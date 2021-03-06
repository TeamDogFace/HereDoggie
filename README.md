Doge Finder
===========

Find your canine companion in 3 easy steps. 

This web application will run facial detection and then [local binary pattern histogram][1] facial recognition on all possible dogs based on the date lost.

Requirements
------------

* Ruby 2.x
* Rails 4.x

Configuration
-------------

The Mailers use Mandrill so you will need API key. You will need to configure your environment variables or edit `config\application.yml` with the proper values. 

Database
--------

The Production is set to use MySQL and will need proper credentials. To create the database run `create database here_doggie`

Screenshot
----------
![Screenshot](./public/Screenshot.png)

Contributing
------------

We'd love for you to contribute but currently this is our senior design project and letting others contribute would probably be in some violation of a rule set by Penn State.

[1]: http://docs.opencv.org/modules/contrib/doc/facerec/facerec_tutorial.html#local-binary-patterns-histograms

<!-- == README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
-->
