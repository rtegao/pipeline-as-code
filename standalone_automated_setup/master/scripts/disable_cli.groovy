#!groovy

import jenkins.model.Jenkins

Jenkins jenkins = Jenkins.getInstance()

println "--> disabling Jenkins remote CLI"

// disable remote access from jenkins instance (cli) 
jenkins.CLI.get().setEnabled(false)
jenkins.save()