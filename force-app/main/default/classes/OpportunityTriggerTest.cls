@isTest(SeeAllData = false)
public class OpportunityTriggerTest {

   @isTest static void testTrigger() {
        // Get Record Type Ids
		Id helferkreisRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Helferkreis').getRecordTypeId();
		Id klientRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Fluchtling').getRecordTypeId();
		Id ehrenamtRecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Ehrenamtliche').getRecordTypeId();
		Id vermittlungRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('TranslAid_Vermittlung').getRecordTypeId();

        // create test records
        Account helferkreis = new Account(Name = 'Helferkeis', RecordTypeId = helferkreisRecordTypeId);
        insert helferkreis;
        Contact vermittler = new Contact(AccountId = helferkreis.Id, FirstName = 'Vorname', LastName = 'Nachname', RecordTypeId = ehrenamtRecordTypeId);
        insert vermittler;
        Account klient = new Account(FirstName = 'Vorname', LastName = 'Nachname', RecordTypeId = klientRecordTypeId);
        insert klient;
        date myCloseDate = date.newInstance(2020,01,30);
        Opportunity vermittlung = new Opportunity(Name = 'Vermittlung', AccountId = klient.Id, RecordTypeId = vermittlungRecordTypeId, StageName = 'Open', CloseDate = myCloseDate);
        insert vermittlung;

        vermittlung.Fallnummer2__c = '1';
        vermittlung.Sprachen__c = 'Arabisch';
        vermittlung.Termin_Datum__c = myCloseDate;
        vermittlung.Uhrzeit__c = '10:00 Uhr';
        vermittlung.Termin_Dauer__c = '1 Stunde';
        vermittlung.Termin_Details__c = 'Details';
        vermittlung.Termin_Adresse__c = 'Adresse';
        Test.startTest();
        update vermittlung;
        Test.stopTest();
        Opportunity o = [select id, Dolmetscher_Email__c from Opportunity where Id = :vermittlung.Id];
        System.assertEquals('Fall: 1<br>Arabisch<br><b>am 30.01.2020 um 10:00 Uhr (1 Stunde)</b><br>Details<br>Adresse<br>', o.Dolmetscher_Email__c);
	}    
}