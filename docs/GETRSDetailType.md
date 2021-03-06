# SwaggerClient::GETRSDetailType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | An account ID.  | [optional] 
**amount** | **String** | The revenue schedule amount, which is the sum of all revenue items. This field cannot be null and must be formatted based on the currency, such as &#x60;JPY 30&#x60; or &#x60;USD 30.15&#x60;. Test out the currency to ensure you are using the proper formatting otherwise, the response will fail and this error message is returned: &#x60;Allocation amount with wrong decimal places.&#x60;  | [optional] 
**created_on** | **DateTime** | The date when the record was created in &#x60;YYYY-MM-DD HH:MM:SS&#x60; format.  | [optional] 
**currency** | **String** | The type of currency used.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object.  | [optional] 
**linked_transaction_id** | **String** | The linked transaction ID for billing transactions. This field is used for all rules except the custom unlimited or manual recognition rule models. If using the custom unlimited rule model, then the field value must be null. If the field is not null, then the referenceId field must be null.   | [optional] 
**linked_transaction_number** | **String** | The number for the linked invoice item or invoice item adjustment transaction. This field is used for all rules except the custom unlimited or manual recognition rule models.  If using the custom unlimited or manual recognition rule models, then the field value is null.   | [optional] 
**linked_transaction_type** | **String** | The type of linked transaction for billing transactions, which can be invoice item or invoice item adjustment. This field is used for all rules except the custom unlimited or manual recognition rule models.  | [optional] 
**notes** | **String** | Additional information about this record.  | [optional] 
**number** | **String** | Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | [optional] 
**recognition_rule_name** | **String** | The name of the recognition rule.  | [optional] 
**recognized_revenue** | **String** | The revenue that was distributed in a closed accounting period.  | [optional] 
**reference_id** | **String** | Reference ID is used only in the custom unlimited rule to create a revenue schedule. In this scenario, the revenue schedule is not linked to an invoice item or invoice item adjustment.  | [optional] 
**revenue_items** | [**Array&lt;GETRsRevenueItemType&gt;**](GETRsRevenueItemType.md) | Revenue items are listed in ascending order by the accounting period start date.  | [optional] 
**revenue_schedule_date** | **Date** | The effective date of the revenue schedule. For example, the revenue schedule date for bookings-based revenue recognition is typically set to the order date or contract date.  The date cannot be in a closed accounting period. The date must be in the &#x60;YYYY-MM-DD&#x60; format.  | [optional] 
**subscription_charge_id** | **String** | The original subscription charge ID.  | [optional] 
**subscription_id** | **String** | The original subscription ID.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**undistributed_unrecognized_revenue** | **String** | Revenue in the open-ended accounting period.  | [optional] 
**unrecognized_revenue** | **String** | Revenue distributed in all open accounting periods, which includes the open-ended accounting period.  | [optional] 
**updated_on** | **DateTime** | The date when the revenue automation start date was set.  | [optional] 


