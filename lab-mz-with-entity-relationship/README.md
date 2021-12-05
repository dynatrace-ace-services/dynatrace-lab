#  Lab - mz-with-entity-relationship

In this lab the rules of your management zone have been modified with entity-relationship.  
You will update the Monaco template from the previous labs with these new rules.   
- type(SERVICE),databaseName.exists(),toRelationships.calls(type(SERVICE),tag(app:easytravel<xx>))  
- type(APPLICATION),fromrelationships.calls(type(SERVICE),tag(app:easytravel<xx>))  
- type(HTTP_CHECK),fromrelationships.calls(type(SERVICE),tag(app:easytravel<xx>))  
- type(SYNTHETIC_TEST),fromRelationships.monitors(type(APPLICATION),entityName(easytravel<xx>))  

Import the new mz template in the lab-onboarding directory (directory with Monaco):  

    cd;cd dynatrace-lab
    cp -R lab-mz-with-entity-relationship/ lab-onboarding/
	   
Validate your variables  

    echo "NEW_CLI="$NEW_CLI;echo "MyTenant=https://"$MyTenant;echo "MyToken="$MyToken;echo "Appname="$Appname;
		   
Deploy with monaco  

    cd;cd dynatrace-lab/lab-onboarding;
    ./monaco deploy -e=environments.yaml lab-mz-with-entity-relationship
