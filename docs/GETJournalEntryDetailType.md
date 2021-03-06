# SwaggerClient::GETJournalEntryDetailType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_period_name** | **String** | Name of the accounting period that the journal entry belongs to.  | [optional] 
**aggregate_currency** | **BOOLEAN** | Returns true if the journal entry is aggregating currencies. That is, if the journal entry was created when the [Aggregate transactions with different currencies during a Journal Run](https://knowledgecenter.zuora.com/CC_Finance/A_Z-Finance/E_Accounting_Periods/C_Configure_accounting_rules#Aggregate_transactions_with_different_currencies_during_a_Journal_Run) setting was configured to &#x60;Yes&#x60;. Otherwise, returns &#x60;false&#x60;.  | [optional] 
**currency** | **String** | Currency used.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object.  | [optional] 
**home_currency** | **String** | Home currency used.  | [optional] 
**journal_entry_date** | **Date** | Date of the journal entry.  | [optional] 
**journal_entry_items** | [**Array&lt;GETJournalEntryItemType&gt;**](GETJournalEntryItemType.md) | Key name that represents the list of journal entry items.  | [optional] 
**notes** | **String** |  Additional information about this record. Character limit: 2,000  | [optional] 
**number** | **String** | Journal entry number in the format JE-00000001.  | [optional] 
**segments** | [**Array&lt;GETJournalEntrySegmentType&gt;**](GETJournalEntrySegmentType.md) | List of segments that apply to the summary journal entry.  | [optional] 
**status** | **String** | Status of journal entry. An enum with the values &#x60;Created&#x60; or &#x60;Cancelled&#x60;.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**time_period_end** | **Date** | End date of time period included in the journal entry.  | [optional] 
**time_period_start** | **Date** | Start date of time period included in the journal entry.  | [optional] 
**transaction_type** | **String** | Transaction type of the transactions included in the summary journal entry.  | [optional] 
**transfer_date_time** | **DateTime** | Date and time that transferredToAccounting was changed to &#x60;Yes&#x60;. This field is returned only when transferredToAccounting is &#x60;Yes&#x60;. Otherwise, this field is &#x60;null&#x60;.  | [optional] 
**transferred_by** | **String** | User ID of the person who changed transferredToAccounting to &#x60;Yes&#x60;. This field is returned only when transferredToAccounting is &#x60;Yes&#x60;. Otherwise, this field is &#x60;null&#x60;.  | [optional] 
**transferred_to_accounting** | **String** | Status shows whether the journal entry has been transferred to an accounting system. The possible values are &#x60;No&#x60;, &#x60;Processing&#x60;, &#x60;Yes&#x60;, &#x60;Error&#x60;, &#x60;Ignore&#x60;.  | [optional] 


