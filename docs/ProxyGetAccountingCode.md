# SwaggerClient::ProxyGetAccountingCode

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**category** | **String** |  The category associated with the accounting code. Possible values:  - Assets - Liabilities - Equity - Revenue - Expenses **Character limit**: N/A **Z-Finance Required****: **No  | [optional] 
**created_by_id** | **String** |  The identifier of the user who created the accounting code. **Character limit:** N/A **Z-Finance Required****: **No  | [optional] 
**created_date** | **DateTime** |  The date when the accounting code was created. **Character limit:** N/A **Z-Finance Required****: **No  | [optional] 
**gl_account_name** | **String** |  The account name in general ledger (GL) that corresponds to accounting code. **Character limit**: 255 **Z-Finance Required:** Yes  | [optional] 
**gl_account_number** | **String** |  The account number in the GL that corresponds to the accounting code. **Character limit**: 50 **Z-Finance Required:** Yes  | [optional] 
**id** | **String** | Object identifier. | [optional] 
**name** | **String** |  The name of the accounting code. **Character limit**: 100 **Z-Finance Required:** No  | [optional] 
**notes** | **String** |  Any note about the accounting code. **Character limit:** 2000 **Z-Finance Required**: No  | [optional] 
**status** | **String** |  The accounting code status. On create, the accounting code is created in Active status by default. Possible values:  - Active - Inactive **Character limit:** N/A **Z-Finance Required****: **No  | [optional] 
**type** | **String** |  The accounting code type. Possible values:  - AccountsReceivable - Cash - OtherAssets - CustomerCashOnAccount - DeferredRevenue - SalesTaxPayable - OtherLiabilities - SalesRevenue - SalesDiscounts - OtherRevenue - OtherEquity - BadDebt - OtherExpenses **Character limit**: N/A **Z-Finance Required:** No  | [optional] 
**updated_by_id** | **String** |  The identifier of the user who created the accounting code. **Character limit:** N/A **Z-Finance Required**: No  | [optional] 
**updated_date** | **DateTime** |  The date when the accounting code was updated. **Character limit:** N/A **Z-Finance Required****: **No  | [optional] 


