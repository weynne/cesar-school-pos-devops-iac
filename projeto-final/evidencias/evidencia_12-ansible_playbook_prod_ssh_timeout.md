
PLAY [Configure the docker host] ***********************************************

TASK [Gathering Facts] *********************************************************
ok: [projeto-final-pos-devops-iac-prod-host-instance]

TASK [docker : Install the docker engine and the collection's python dependency] ***
changed: [projeto-final-pos-devops-iac-prod-host-instance]

TASK [docker : Ensure the docker daemon is running and starts on boot] *********
changed: [projeto-final-pos-devops-iac-prod-host-instance]

TASK [docker : Let the login user reach the docker socket without sudo] ********
changed: [projeto-final-pos-devops-iac-prod-host-instance]

TASK [app : Install git so the application source can be cloned] ***************
changed: [projeto-final-pos-devops-iac-prod-host-instance]

TASK [app : Clone the application source] **************************************
[ERROR]: Task failed: Timeout (12s) waiting for privilege escalation prompt:
Origin: /home/weynne/cesar-school/devops/iac/github/cesar-school-pos-devops-iac/projeto-final/ansible/roles/app/tasks/main.yml:7:3

5     state: present
6
7 - name: Clone the application source
    ^ column 3

fatal: [projeto-final-pos-devops-iac-prod-host-instance]: UNREACHABLE! => {"changed": false, "msg": "Task failed: Timeout (12s) waiting for privilege escalation prompt:", "unreachable": true}

PLAY RECAP *********************************************************************
projeto-final-pos-devops-iac-prod-host-instance : ok=5    changed=4    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   

