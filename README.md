#Url Redirect Engine

The function of the Url Redirect Engine is to perform a URL redirect to a specified URL based on the rule/regex specified.


## Prerquisites:

You will need to have the following installed to run the application:

**Ruby 2.4.X** - See instructions on how to install ruby (https://www.ruby-lang.org/en/documentation/installation/)
**Bundler 1.15.X** - See instructions on how to install bundler (http://bundler.io/)

## Running the application:

Clone the application using the following command:
```
git clone https://github.com/denisdbell/url-redirect-engine.git

```
Navigate to the **url-redirect-engine** folder:
```
cd url-redirect-engine

```
Install dependencies using bundler:

```
bundle install
```

Run the database migrations:
```
rails db:migrate
```
Start the application servers:
```
rails server
```

Adding a redirect rule:

Navigate to http://localhost/redirects/new

1. Enter a **Rule** in the form of a regex.
2. Enter the **New Url**.

Testing the redirect:

##Querying

The query feature allows you to test a rule without actually performing a redirect. This is useful for testing purposes. To perform a query the ***query** parameter of the url must be set tor **true**, see below:

**REQUEST [GET]-** http://localhost:3000/perform_redirect?url=http://somwhere.com& **query=true**

**RESPONSE-**{"status":"ok","message":"No redirect found for http://somwhere.com"}

##Performing a redirect

When performing an actual redirect the  the ***query** parameter of the url must be set tor **false**. The url must also be invoked from a web browser to see the redirect, see below:

**REQUEST [GET]-** http://localhost:3000/perform_redirect?url=http://somwhere.com& **query=false**

#Viewing Redirect Logs:

To view logs for all the redirects, naviagte to http://localhost:3000/redirect_logs.


##And thats it!!!

