trigger taskThatCanBeDeletedBySA on Task (before delete) {

//Write a trigger, only the admin should be able to delete the task.

    Id pid = Userinfo.getProfileId(); //getting the Profile Id of the User who is trying to Delete the Task using the “Userinfo.getProfileId()” method
    Profile pname=[select Name from Profile where id=:pid];//Then we are getting the Name of the Profile bypassing the Id of the Profile in the Query
    for(Task taskObj:Trigger.old){//loop all the Tasks which are about to get deleted check if the Profile Name which we got from Query is Admin or not, if not we are displaying the Error Message.
    if(pname.Name!='System Administrator'){
    taskObj.addError('No Access for Deletion');
    }
    }
    }