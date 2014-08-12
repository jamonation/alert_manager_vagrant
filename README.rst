Alert Manager Vagrant Development Virtual Machine
=================================================

1. To get started with alert_manager development, begin by installing Vagrant and VirtualBox. Visit http://www.vagrantup.com/downloads and install the latest version of Vagrant - this will ensure compatibility with the provisioning step of creating the VM.

2. Run ``git clone https://github.com/jamonation/alert_manager_vagrant.git`` to a location of your choosing. This step will checkout the Vagrant files used to create the virtutal machine.

3. ``cd alert_manager_vagrant`` or into the name of the cloned directory if you chose a custom one.

4. Run ``git submodule update --init --recursive`` - this command will pull the alert_manager codebase into the Vagrant provisioning environment for live development.

5. Fire up the VM! ``vagrant up --provision``. Wait a while. This step will download the base Ubuntu 14.04 image, pull in various pip packages, setup MySQL, and provision various other things required for alert_mangager development.

6. Once Step 5. is complete, you will be left with a normal prompt. Run ``vagrant ssh`` to connect to the VM and begin development.

7. From your new prompt inside the VM, run ``load_alert_manager_sql`` to populate MySQL with the sample alert_mangager data.

8. Finally, run ``start_alert_manager`` to start the application. Visit http://10.31.41.59:5000/alerts.html in your browser to confirm it is working.

9. You can edit alert_manager files from outside the VM on your host system with your IDE/editor of choice. The shared codebase and uWSGI server that hosts alert_manager will automatically reload on any changes. You can also edit files inside the VM and uWSGI will reload automatically.
