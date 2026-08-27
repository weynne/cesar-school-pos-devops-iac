[WARNING]: Found variable using reserved name 'tags'.
Origin: <unknown>

tags


PLAY [Configure the docker host] ***********************************************

TASK [Gathering Facts] *********************************************************
[WARNING]: Host 'projeto-final-pos-devops-iac-dev-host-instance' is using the discovered Python interpreter at '/usr/bin/python3.9', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ok: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [docker : Install the docker engine and the collection's python dependency] ***
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [docker : Ensure the docker daemon is running and starts on boot] *********
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [docker : Let the login user reach the docker socket without sudo] ********
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [app : Install git so the application source can be cloned] ***************
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [app : Clone the application source] **************************************
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [app : Render the Dockerfile into the build context] **********************
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [app : Build the application image] ***************************************
changed: [projeto-final-pos-devops-iac-dev-host-instance]

TASK [app : Run the application container] *************************************
changed: [projeto-final-pos-devops-iac-dev-host-instance]

PLAY RECAP *********************************************************************
projeto-final-pos-devops-iac-dev-host-instance : ok=9    changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

