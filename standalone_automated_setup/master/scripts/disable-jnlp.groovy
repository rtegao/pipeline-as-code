#!groovy

import jenkins.model.Jenkins
import jenkins.security.s2m.*

Jenkins jenkins = Jenkins.getInstance()

// disable JNPL  
println "--> disabling JNLP"
// set 0 indicates random available TCP port, -1 to sisable this service
jenkins.setSlaveAgentPort(-1)

println "--> disabling non-encrypted protocols"
// initialize HashSet structure with available agent protocol
HashSet<String> newProtocols = new HashSet<>(jenkins.getAgentProtocols());
// removes old ununcrypted protocols 
newProtocols.removeAll(Arrays.asList(
        "JNLP3-connect", "JNLP2-connect", "JNLP-connect", "CLI-connect"
));
// save new list off protocols, without the old ones
jenkins.setAgentProtocols(newProtocols);
jenkins.save()