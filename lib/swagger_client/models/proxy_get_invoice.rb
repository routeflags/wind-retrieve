=begin
#Zuora API Reference

# # Introduction  Welcome to the reference for the Zuora REST API!  <a href=\"http://en.wikipedia.org/wiki/REST_API\" target=\"_blank\">REST</a> is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology.  The Zuora REST API provides a broad set of operations and resources that:  * Enable Web Storefront integration from your website. * Support self-service subscriber sign-ups and account management. * Process revenue schedules through custom revenue rule models. * Enable manipulation of most objects in the Zuora Object Model.  ## Endpoints  The Zuora REST API is provided via the following endpoints.  | Tenant                 | Base URL for REST Endpoints                                                                                                                                         | |-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------| | Production | https://rest.zuora.com/v1                                                                                                                                           | | API Sandbox    | https://rest.apisandbox.zuora.com/v1                                                                                                                                |  The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.  ## Access to the API  If you have a Zuora tenant, you already have access to the API.  If you don't have a Zuora tenant, go to <a href=\"https://www.zuora.com/resource/zuora-test-drive\" target=\"_blank\">https://www.zuora.com/resource/zuora-test-drive</a> and sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog.   We recommend that you <a href=\"https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User\" target=\"_blank\">create an API user</a> specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.   # Authentication  There are three ways to authenticate:   *   Use username and password. Include authentication with each request in the header:      *   `apiAccessKeyId`      *   `apiSecretAccessKey`      *   `entityId` or `entityName` (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)    * Use an authorization cookie. The  cookie authorizes the user to make calls to the REST API for the duration specified in  **Administration > Security Policies > Session timeout**. The cookie expiration time is reset with this duration after every call to the REST API. To obtain a cookie, call the REST  `connections` resource with the following API user information:     *   ID     *   password     *   entity Id or entity name (Only for [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity \"Multi-entity\"). See \"Entity Id and Entity Name\" below for more information.)    *   For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request. See below for more details.   ## Entity Id and Entity Name  The `entityId` and `entityName`  parameters are only used for  [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity).  The  `entityId` and `entityName` parameters specify the Id and the  [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name \"Introduction to Entity and Entity Hierarchy\") that you want to access, respectively. Note that you must have permission to access the entity. You can get the entity Id and entity name through the REST GET Entities call.  You can specify either the  `entityId` or `entityName` parameter in the authentication to access and view an entity.  *   If both `entityId` and `entityName` are specified in the authentication, an error occurs.  *   If neither  `entityId` nor  `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.   See [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication \"Zuora Multi-entity\") for more information.  ## Token Authentication for CORS-Enabled APIs  The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and makes your payment forms look just like any other part of your website.  For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication.  The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should not be considered a replacement to the existing cookie authentication** mechanism.  See [Zuora CORS REST ](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST \"Zuora CORS REST\")for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See  [HMAC Signatures](/BC_Developers/REST_API/B_REST_API_reference/HMAC_Signatures \"HMAC Signatures\") for details on the HMAC method that returns the authentication token.    # Requests and Responses   ## Request IDs  As a general rule, when asked to supply a \"key\" for an account or subscription (accountKey, account-key, subscriptionKey, subscription-key), you can provide either the actual ID or the number of the entity.  ## HTTP Request Body  Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request.  The Zuora REST API accepts JSON in the HTTP request body.  No other data format (e.g., XML) is supported.   ## Testing a Request  Use a third party client, such as [curl](https://curl.haxx.se/ \"curl\"), [Postman](https://www.getpostman.com/ \"Postman\"),  or [Advanced REST Client](https://advancedrestclient.com/ \"Advanced REST Client\"), to test the Zuora REST API.  You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.  ## Testing with Credit Cards  Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards \"C_Zuora_User_Guides/A_Billing_and_Payments/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards\").       ## Error Handling  Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors \"Responses and errors\").    # Pagination  When retrieving information (using GET methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`. If this value is empty or invalid, `pageSize` typically defaults to `10`.  The default value for the maximum number of rows retrieved can be overridden at the method level.  If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page.  If this value is not provided, no more rows are available. No \"previous page\" element is explicitly provided; to support backward paging, use the previous call.  ## Array Size  For data items that are not paginated, the REST API supports arrays of up to 300 rows.  Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.   # API Versions  The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.   ## Major Version  The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. For example,  `POST https://rest.zuora.com/v1/subscriptions` .   ## Minor Version  Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it.   Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.   If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the  `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.  The supported minor versions are not serial, see [Zuora REST API Minor Version History](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/Zuora_REST_API_Minor_Version_History \"Zuora REST API Minor Version History\") for the fields and their supported minor versions. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.  You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the POST Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. The `zuora-version` parameter is case sensitive.   For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.     # Zuora Object Model The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.  <a href=\"https://www.zuora.com/wp-content/uploads/2016/11/ZuoraERD.jpeg\" target=\"_blank\"><img src=\"https://www.zuora.com/wp-content/uploads/2016/11/ZuoraERD.jpeg\" alt=\"Zuora Object Model Diagram\"></a> 

OpenAPI spec version: 1.0.0
Contact: docs@zuora.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'date'

module SwaggerClient

  class ProxyGetInvoice
    # 
    attr_accessor :account_id

    #  The amount of the invoice adjustments associated with the invoice. **Character limi**t: 16 **Values**: a valid currency amount 
    attr_accessor :adjustment_amount

    #  The sum of all charges and taxes associated with the invoice. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :amount

    #  The sum of all charges associated with the invoice. Taxes are excluded from this value. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :amount_without_tax

    #  The remaining balance of the invoice after all payments, adjustments, and refunds are applied. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :balance

    #  Required 
    attr_accessor :body

    #  Additional information related to the invoice that a Zuora user added to the invoice. **Character limit**: 255 **Values:** a string of 255 characters or fewer 
    attr_accessor :comments

    #  The user ID of the person who created the invoice. If a bill run generated the invoice, then the value is the user ID of person who created the bill run. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :created_by_id

    #  The date when the invoice was generated. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :created_date

    #  The currency amount of the adjustment applied to the customer's credit balance. **Character limit**: 16 **Values**: a valid currency amount This field is only available if the [Zuora Global Support](http://support.zuora.com/) to enable this feature.   
    attr_accessor :credit_balance_adjustment_amount

    #  The date by which the payment for this invoice is due. **Character limit**: 29 **Version notes**: -- 
    attr_accessor :due_date

    # Object identifier.
    attr_accessor :id

    #  Specifies whether the invoice includes one-time charges. You can use this field only with the Generate call for the Invoice object. **Character limit**: 5 **Values**: automatically generated from one of the following: `True` (default), `False` 
    attr_accessor :includes_one_time

    #  Specifies whether the invoice includes recurring charges. You can use this field only with the Generate call for the Invoice object. **Character limit**: 5 **Values**: automatically generated from one of the following: `True` (default), `False` 
    attr_accessor :includes_recurring

    #  Specifies whether the invoice includes usage charges. You can use this field only with the Generate call for the Invoice object. **Character limit**: 5 **Values**: automatically generated from one of the following: `True `(default), `False` 
    attr_accessor :includes_usage

    #  Specifies the date on which to generate the invoice. **Character limit**: 29 **Version notes**: -- 
    attr_accessor :invoice_date

    #  The unique identification number for the invoice. This number is returned as a string. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :invoice_number

    #  The date when the invoice was last emailed. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :last_email_sent_date

    #  The amount of payments applied to the invoice. **Character limit**: 16 **Value**s: automatically generated 
    attr_accessor :payment_amount

    #  The user ID of the person who moved the invoice to Posted status. **Character limit**: 32 **Values**: automatically generated 
    attr_accessor :posted_by

    #  The date when the invoice was posted. **Character limit:** 29 **Values**: automatically generated 
    attr_accessor :posted_date

    #  Specifies the amount of a refund that was applied against an earlier payment on the invoice. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :refund_amount

    #  The status of the invoice in the system. This status is not the status of the payment of the invoice, just the status of the invoice itself. **Character limit**: 8 **Values**: one of the following:  -  Draft (default, automatically set upon invoice creation)  -  Posted  -  Canceled  
    attr_accessor :status

    #  This date is used to determine which charges are to be billed. All charges that are to be billed on this date or prior will be included in this bill run. **Character limit**: 29 **Version notes**: -- 
    attr_accessor :target_date

    #  The total amount of the taxes applied to the invoice. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :tax_amount

    #  The total amount of the invoice that is exempt from taxation. **Character limit**: 16 **Values**: automatically generated 
    attr_accessor :tax_exempt_amount

    #  Specifies whether or not the invoice was transferred to an external accounting system, such as NetSuite. **Character limit**: 10 **Values**: Processing, Yes, Error, Ignore 
    attr_accessor :transferred_to_accounting

    # 
    attr_accessor :updated_by_id

    #  The date when the invoice was last updated. **Character limit**: 29 **Values**: automatically generated 
    attr_accessor :updated_date


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'AccountId',
        :'adjustment_amount' => :'AdjustmentAmount',
        :'amount' => :'Amount',
        :'amount_without_tax' => :'AmountWithoutTax',
        :'balance' => :'Balance',
        :'body' => :'Body',
        :'comments' => :'Comments',
        :'created_by_id' => :'CreatedById',
        :'created_date' => :'CreatedDate',
        :'credit_balance_adjustment_amount' => :'CreditBalanceAdjustmentAmount',
        :'due_date' => :'DueDate',
        :'id' => :'Id',
        :'includes_one_time' => :'IncludesOneTime',
        :'includes_recurring' => :'IncludesRecurring',
        :'includes_usage' => :'IncludesUsage',
        :'invoice_date' => :'InvoiceDate',
        :'invoice_number' => :'InvoiceNumber',
        :'last_email_sent_date' => :'LastEmailSentDate',
        :'payment_amount' => :'PaymentAmount',
        :'posted_by' => :'PostedBy',
        :'posted_date' => :'PostedDate',
        :'refund_amount' => :'RefundAmount',
        :'status' => :'Status',
        :'target_date' => :'TargetDate',
        :'tax_amount' => :'TaxAmount',
        :'tax_exempt_amount' => :'TaxExemptAmount',
        :'transferred_to_accounting' => :'TransferredToAccounting',
        :'updated_by_id' => :'UpdatedById',
        :'updated_date' => :'UpdatedDate'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_id' => :'String',
        :'adjustment_amount' => :'Float',
        :'amount' => :'Float',
        :'amount_without_tax' => :'Float',
        :'balance' => :'Float',
        :'body' => :'String',
        :'comments' => :'String',
        :'created_by_id' => :'String',
        :'created_date' => :'DateTime',
        :'credit_balance_adjustment_amount' => :'Float',
        :'due_date' => :'Date',
        :'id' => :'String',
        :'includes_one_time' => :'BOOLEAN',
        :'includes_recurring' => :'BOOLEAN',
        :'includes_usage' => :'BOOLEAN',
        :'invoice_date' => :'Date',
        :'invoice_number' => :'String',
        :'last_email_sent_date' => :'DateTime',
        :'payment_amount' => :'Float',
        :'posted_by' => :'String',
        :'posted_date' => :'DateTime',
        :'refund_amount' => :'Float',
        :'status' => :'String',
        :'target_date' => :'Date',
        :'tax_amount' => :'Float',
        :'tax_exempt_amount' => :'Float',
        :'transferred_to_accounting' => :'String',
        :'updated_by_id' => :'String',
        :'updated_date' => :'DateTime'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'AccountId')
        self.account_id = attributes[:'AccountId']
      end

      if attributes.has_key?(:'AdjustmentAmount')
        self.adjustment_amount = attributes[:'AdjustmentAmount']
      end

      if attributes.has_key?(:'Amount')
        self.amount = attributes[:'Amount']
      end

      if attributes.has_key?(:'AmountWithoutTax')
        self.amount_without_tax = attributes[:'AmountWithoutTax']
      end

      if attributes.has_key?(:'Balance')
        self.balance = attributes[:'Balance']
      end

      if attributes.has_key?(:'Body')
        self.body = attributes[:'Body']
      end

      if attributes.has_key?(:'Comments')
        self.comments = attributes[:'Comments']
      end

      if attributes.has_key?(:'CreatedById')
        self.created_by_id = attributes[:'CreatedById']
      end

      if attributes.has_key?(:'CreatedDate')
        self.created_date = attributes[:'CreatedDate']
      end

      if attributes.has_key?(:'CreditBalanceAdjustmentAmount')
        self.credit_balance_adjustment_amount = attributes[:'CreditBalanceAdjustmentAmount']
      end

      if attributes.has_key?(:'DueDate')
        self.due_date = attributes[:'DueDate']
      end

      if attributes.has_key?(:'Id')
        self.id = attributes[:'Id']
      end

      if attributes.has_key?(:'IncludesOneTime')
        self.includes_one_time = attributes[:'IncludesOneTime']
      end

      if attributes.has_key?(:'IncludesRecurring')
        self.includes_recurring = attributes[:'IncludesRecurring']
      end

      if attributes.has_key?(:'IncludesUsage')
        self.includes_usage = attributes[:'IncludesUsage']
      end

      if attributes.has_key?(:'InvoiceDate')
        self.invoice_date = attributes[:'InvoiceDate']
      end

      if attributes.has_key?(:'InvoiceNumber')
        self.invoice_number = attributes[:'InvoiceNumber']
      end

      if attributes.has_key?(:'LastEmailSentDate')
        self.last_email_sent_date = attributes[:'LastEmailSentDate']
      end

      if attributes.has_key?(:'PaymentAmount')
        self.payment_amount = attributes[:'PaymentAmount']
      end

      if attributes.has_key?(:'PostedBy')
        self.posted_by = attributes[:'PostedBy']
      end

      if attributes.has_key?(:'PostedDate')
        self.posted_date = attributes[:'PostedDate']
      end

      if attributes.has_key?(:'RefundAmount')
        self.refund_amount = attributes[:'RefundAmount']
      end

      if attributes.has_key?(:'Status')
        self.status = attributes[:'Status']
      end

      if attributes.has_key?(:'TargetDate')
        self.target_date = attributes[:'TargetDate']
      end

      if attributes.has_key?(:'TaxAmount')
        self.tax_amount = attributes[:'TaxAmount']
      end

      if attributes.has_key?(:'TaxExemptAmount')
        self.tax_exempt_amount = attributes[:'TaxExemptAmount']
      end

      if attributes.has_key?(:'TransferredToAccounting')
        self.transferred_to_accounting = attributes[:'TransferredToAccounting']
      end

      if attributes.has_key?(:'UpdatedById')
        self.updated_by_id = attributes[:'UpdatedById']
      end

      if attributes.has_key?(:'UpdatedDate')
        self.updated_date = attributes[:'UpdatedDate']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          adjustment_amount == o.adjustment_amount &&
          amount == o.amount &&
          amount_without_tax == o.amount_without_tax &&
          balance == o.balance &&
          body == o.body &&
          comments == o.comments &&
          created_by_id == o.created_by_id &&
          created_date == o.created_date &&
          credit_balance_adjustment_amount == o.credit_balance_adjustment_amount &&
          due_date == o.due_date &&
          id == o.id &&
          includes_one_time == o.includes_one_time &&
          includes_recurring == o.includes_recurring &&
          includes_usage == o.includes_usage &&
          invoice_date == o.invoice_date &&
          invoice_number == o.invoice_number &&
          last_email_sent_date == o.last_email_sent_date &&
          payment_amount == o.payment_amount &&
          posted_by == o.posted_by &&
          posted_date == o.posted_date &&
          refund_amount == o.refund_amount &&
          status == o.status &&
          target_date == o.target_date &&
          tax_amount == o.tax_amount &&
          tax_exempt_amount == o.tax_exempt_amount &&
          transferred_to_accounting == o.transferred_to_accounting &&
          updated_by_id == o.updated_by_id &&
          updated_date == o.updated_date
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_id, adjustment_amount, amount, amount_without_tax, balance, body, comments, created_by_id, created_date, credit_balance_adjustment_amount, due_date, id, includes_one_time, includes_recurring, includes_usage, invoice_date, invoice_number, last_email_sent_date, payment_amount, posted_by, posted_date, refund_amount, status, target_date, tax_amount, tax_exempt_amount, transferred_to_accounting, updated_by_id, updated_date].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
