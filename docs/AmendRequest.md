# SwaggerClient::AmendRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amend_options** | [**Array&lt;AmendOptions&gt;**](AmendOptions.md) | Use the &#x60;AmendOptions&#x60; container to specify billing options, such as invoice generation and when to process payments.  | [optional] 
**amendments** | [**Array&lt;Amendment&gt;**](Amendment.md) | The &#x60;Amendment&#x60; object holds the changes that you want to make to the Subscription specified by the &#x60;SubscriptionId&#x60;,  including its &#x60;RatePlan&#x60;, &#x60;RatePlanCharge&#x60;, and &#x60;RatePlanChargeTier&#x60;.  | [optional] 
**preview_options** | [**Array&lt;PreviewOptions&gt;**](PreviewOptions.md) | Use the &#x60;PreviewOptions&#x60; container to preview an amendment before committing its changes to a subscription.  You can use a preview to provide a quote of the new charges to a customer before the customer commits to the amended subscription.  For example, make an Amend call with an Amendment object that removes an existing rate plan,  another Amendment object that adds a new rate plan, and turn on the preview options.  | [optional] 


