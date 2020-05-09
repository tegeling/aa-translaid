public with sharing class OpportunityTriggerHandler {
  private boolean isExecuting = false;
  private integer batchSize = 0;

  public OpportunityTriggerHandler(boolean isExecuting, integer size) {
    m_isExecuting = isExecuting;
    BatchSize = size;
  }

  public void onBeforeInsert(List<Opportunity> newOpportunity) {
    OpportunityActions.translaidSetEmailTemplate(newOpportunity);
  }
  public void onBeforeUpdate(
    List<Opportunity> newOpportunity,
    List<Opportunity> oldOpportunity,
    Map<ID, Opportunity> newOpportunityMap,
    Map<ID, Opportunity> oldOpportunityMap
  ) {
    OpportunityActions.translaidSetEmailTemplate(newOpportunity);
  }
}
