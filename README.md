# README

### Setup:
1. Clone the repo
2. Install your gems
3. run 'rails db:create'
4. run 'rails db:migrate'
5. run 'rails db:seed'
  
  After seeding the database you should have 3 Accounts, 10 Members and 4 Addresses.

### 3rd API Party Integration

Lets prototype a 3rd party API integration. This 3rd party integration will have to be built from scratch, because there are gems currently available. Here are the requirements:

We’ll use a Bearer token to authenticate all our POST & GET requests by adding it into headers. We'll supply you the token via email and you send it over in an Authorization header. We’ll need to accommodate these endpoints:

  - POST - create primary member
      - This takes the below payload and creates a Primary Member
  - POST - create dependent member
      - This takes the below payload and creates a Dependent Member
  - GET - retrieve member
      - Simply retrieves a Member via the external_id field (which you get to define)


### Endpoint Information:

##### Payload Notes:

You'll need to define the external_id field. The only restrictions are it must be an integer, and its unique. This will act as a primary key for the Member object. The address fields need to be populated with a 'home' address. This distinction is found on the Address object under the is_type attribute. Members can have both a home and a mailing address. If a dependent does not have a home address, then we will use the primary's home address. 

  - POST#create for primary members:
    - URL: http://cratebind-challenge-api.com/memd/members
    - All fields are required except street_2
    - Response will be the member
    - Payload: 
```ruby
        {
          member: { 
            external_id:    integer,
            relationship:   integer,    # Valid value:    18
            first_name:     string,
            last_name:      string,
            gender:         string,     # Valid values:   "M" or "F"
            plancode:       string,     # Valid value:    "11AA22BB"
            street_1:       string,
            street_2:       string,
            city:           string,
            state:          string,     # Example values: "FL" or "NY"
            zipcode:        string,
            dob:            date,
            benefit_start:  date
          }
        }
```


 - POST#create for dependent members:
    - URL: http://cratebind-challenge-api.com/memd/members/:primary_external_id
     - Response will be the member
    - Payload: The payload is identical to POST#create for primary members with this exception
```
        {
          relationship:   integer,    Valid value:    19
        }
```
  - GET#retrieve member:
    - URL: http://cratebind-challenge-api.com/memd/members/:id
    - Response will be the member


 Feel free to construct this integration however you like. When we are finished, we'll use the Rails console to interact with the API




