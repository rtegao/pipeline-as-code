#!groovy

import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins

println "--> enabling CSRF protection"

def instance = Jenkins.instance()

// enable csrf protection
instance.setCrumbIssuer(new DefaultCrumbIssuer(true))
instance.save()