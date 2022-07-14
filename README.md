# README

### Setup:
1. Clone the repo
2. Install your gems
3. run 'rails db:create'
4. run 'rails db:migrate'
5. run 'rails db:seed'
  
  After seeding the database you should have 3 Accounts, 10 Members and 4 Addresses.

### MeMD 3rd Party Integration

Lets build a MeMD integration. This 3rd party integration will have to be built from scratch, because there are gems currently available. Here are the requirements:

We’ll use a Bearer token to authenticate all our requests by adding it into headers. Bearer tokens expire every 25 hours. We'll supply the token when we open the project together and we'll send it over in an Authorization header. We’ll need to accommodate these endpoints:

  - POST - create primary/dependent
      - This takes a collection of ActiveRecord objects and creates a MeMD Member
  - GET - retrieve member
      - Simply retrieves a MeMD Member via the external_id field (which we will define)


### Endpoint Information:

##### Payload Notes:

We get to define the external_id and this will act as a primary key for the MeMD Member object. The address fields need to be populated with a 'home' address. This distinction is found on the Address object under the is_type attribute. Members can have both a home and a mailing address. If a dependent does not have a home address, then we will use the primary's home address. 

  - POST#create for primary members:
    - URL: http://cratebind-challenge-api.com/memd/members
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


 Feel free to construct this integration however you like. When we are finished, we'll use the Rails console to interact with the MeMD API




