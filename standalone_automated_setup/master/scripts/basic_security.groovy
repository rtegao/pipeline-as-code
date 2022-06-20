#!groovy

import jenkins.model.*
import hudson.security.*

// get an instance of jenkins model
def instance = Jenkins.getInstance()  

println "---> creating local user"

// create a new user account, by registering a password to the user
def user = System.getenv('JENKINS_USER')
def password = System.getenv('JENKINS_PASSWORD')

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(user, password)
instance.setSecurityRealm(hudsonRealm)

// gives full access to logged-in users
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
instance.save()