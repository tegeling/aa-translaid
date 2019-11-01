public without sharing class OpportunityActions {

    public static void translaidSetEmailTemplate ( List<Opportunity> newOpportunity)
    {
        // Set email template for Dolmetscher
        Id translaidRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('TranslAid_Vermittlung').getRecordTypeId();
        for(Opportunity o : newOpportunity) {
            if (o.RecordTypeId == translaidRecordTypeId) {
                o.Dolmetscher_Email__c = 'Fall: ' + o.Fallnummer2__c + '<br>';
                o.Dolmetscher_Email__c += o.Sprachen__c + '<br>';
                if (o.Termin_Datum__c != NULL) {
                    o.Dolmetscher_Email__c += '<b>am ' + o.Termin_Datum__c.format() + ' um ' + o.Uhrzeit__c + ' (' + o.Termin_Dauer__c + ')</b><br>';
                } else {
                    o.Dolmetscher_Email__c += '<b>um ' + o.Uhrzeit__c + ' (' + o.Termin_Dauer__c + ')</b><br>';
                }             
                o.Dolmetscher_Email__c +=  o.Termin_Details__c + '<br>';
                o.Dolmetscher_Email__c +=  o.Termin_Adresse__c + '<br>';
            }
        }
    }

}
