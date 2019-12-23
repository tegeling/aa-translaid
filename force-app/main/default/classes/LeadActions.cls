public without sharing class LeadActions {

    public static void translaidSetAktionstermine (List<Lead> newLead)
    {
        // query all active TranslAid Aktionen
        Id ehrenamtRecordTypeId = Schema.SObjectType.Workshop__c.getRecordTypeInfosByDeveloperName().get('Ehrenamt_Aktion').getRecordTypeId();
        List<Workshop__c> aktionen = [select Id, Name, Startdatum__c, Start_Uhrzeit__c, Aktive_Aktion__c, Workshop_Typ__c, ArrivalAid_Programm__c from Workshop__c where RecordTypeId = :ehrenamtRecordTypeId and Aktive_Aktion__c = true and Workshop_Typ__c = 'TranslAid Einführung' and ArrivalAid_Programm__c = 'TranslAid' order by Startdatum__c];

        // Set Aktionstermine for each Lead
        Id translAidDolmetscherRecordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByDeveloperName().get('TranslAid_Dolmetscher').getRecordTypeId();
        for(Lead l : newLead) {
            if (l.RecordTypeId == translAidDolmetscherRecordTypeId) {
                l.Aktionstermine__c = '<ul>';
                for (Workshop__c w : aktionen) {
                    if (w.Startdatum__c != NULL && w.Start_Uhrzeit__c != NULL) {
                        String uhrzeit = '' + w.Start_Uhrzeit__c;
                        l.Aktionstermine__c += '<li>am ' + w.Startdatum__c.format() + ' um ' + uhrzeit.left(uhrzeit.lastIndexOf(':')) + ' Uhr</li>';
                    }
                }
                l.Aktionstermine__c += '</ul>';
            }
        }
    }
}
