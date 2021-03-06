# SwaggerClient::POSTJournalEntryType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_period_name** | **String** | Name of the accounting period. The open-ended accounting period is named &#x60;Open-Ended&#x60;.   | 
**currency** | **String** | The type of currency used.   Currency must be active in **Z-Billing Settings &gt; Customize Currencies.**  | 
**custom_field__c** | **String** | Any custom fields defined for this object.  | [optional] 
**journal_entry_date** | **Date** | Date of the journal entry.  | 
**journal_entry_items** | [**Array&lt;POSTJournalEntryItemType&gt;**](POSTJournalEntryItemType.md) | Key name that represents the list of journal entry items.  | 
**notes** | **String** | The number associated with the revenue event.  Character limit: 2,000  | [optional] 
**segments** | [**Array&lt;POSTJournalEntrySegmentType&gt;**](POSTJournalEntrySegmentType.md) | List of segments that apply to the summary journal entry.  | [optional] 
**transferred_to_accounting** | **String** | Status shows whether the journal entry has been transferred to an accounting system. The possible values are &#x60;No&#x60;, &#x60;Processing&#x60;, &#x60;Yes&#x60;, &#x60;Error&#x60;, &#x60;Ignore&#x60;.  | [optional] 


