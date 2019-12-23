public with sharing class LeadTriggerHandler {
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    
    public LeadTriggerHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }

   public void OnBeforeInsert(List<Lead> newLead)
    {
        LeadActions.translaidSetAktionstermine (newLead);
    }
    public void OnBeforeUpdate( List<Lead> newLead, List<Lead> oldLead, Map<ID, Lead> newLeadMap , Map<ID, Lead> oldLeadMap )
    {
        LeadActions.translaidSetAktionstermine (newLead);
    }

}
