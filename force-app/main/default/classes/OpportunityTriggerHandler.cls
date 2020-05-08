public with sharing class OpportunityTriggerHandler {
  private boolean m_isExecuting = false;
  private integer BatchSize = 0;

  public OpportunityTriggerHandler(boolean isExecuting, integer size) {
    m_isExecuting = isExecuting;
    BatchSize = size;
  }

  public void OnBeforeInsert(List<Opportunity> newOpportunity) {
    OpportunityActions.translaidSetEmailTemplate(newOpportunity);
  }
  public void OnBeforeUpdate(
    List<Opportunity> newOpportunity,
    List<Opportunity> oldOpportunity,
    Map<ID, Opportunity> newOpportunityMap,
    Map<ID, Opportunity> oldOpportunityMap
  ) {
    OpportunityActions.translaidSetEmailTemplate(newOpportunity);
  }
}
