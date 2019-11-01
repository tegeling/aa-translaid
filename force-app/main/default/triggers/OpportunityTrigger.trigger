trigger OpportunityTrigger on Opportunity (before insert, before update) {

    OpportunityTriggerHandler handler = new OpportunityTriggerHandler(Trigger.isExecuting, Trigger.size);

    if( Trigger.isInsert )
    {
        if(Trigger.isBefore)
        {
            handler.OnBeforeInsert(trigger.New);
        }
    }
    else if ( Trigger.isUpdate )
    {
        if(Trigger.isBefore)
        {
            handler.OnBeforeUpdate(trigger.New ,trigger.Old,Trigger.NewMap,Trigger.OldMap);
        }
    }
}