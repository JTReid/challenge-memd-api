# README

Hello! We're going to be building a simple 3rd party API integration from scratch. This integration will be very similiar to a MeMD integration we built for a client. 

Requirements:
  - 
# MeMD 3rd Party Integration

Lets build a MeMD integration. This 3rd party integration will have to be built from scratch, because theres no company supplied ruby gem. Here are the requirements:

- We’ll use a Bearer token to authenticate all our requests by adding it into headers. Bearer tokens expire every 25 hours. The token we'll use in this project is 'BEARER_xxXXxxXXxxXX' and we'll send it over in an Authorization header
  
- We’ll need to accommodate these endpoints:
  - POST create primary/dependent
      - This takes an ActiveRecord Member and creates a MeMD Member using attributes in our database
  - GET retrieve member
      - Simply retrieves a MeMD Member via the external_id field
  - POST activate policy
      - This takes a member with expired policies and reactivates their policies
  - POST terminate policy
      - Each MeMD Member has attached medical policies. This endpoint will expire those policies


  Endpoint Information:
    - Payload Notes:
      - We define the external_id and this will act as a primary key for MeMD
      - The address fields need to populated with a home address. Members can have both a home and a mailing address. If a dependent does not have a home address, then we will use the primary's home address. The primary will always have a home address.

  POST#create for primary members:
    - URL: http://cratebind-challenge-api.com/memd/members
    - Payload: 
        {
          member: { 
            external_id:    integer,
            relationship:   integer,    Valid value:    18
            first_name:     string,
            last_name:      string,
            gender:         string,     Valid values:   "M" or "F"
            plancode:       string,     Valid value:    "11AA22BB"
            street_1:       string,
            street_2:       string,
            city:           string,
            state:          string,     Example values: "FL" or "NY"
            zipcode:        string,
            dob:            date,
            benefit_start:  date
          }
        }
    - Response will be the member


  POST#create for dependent members:
    - URL: http://cratebind-challenge-api.com/memd/members/:primary_external_id
    - Payload: The payload is identical to POST#create for primary members with this exception
        {
          relationship:   integer,    Valid value:    19
        }
    - Response will be the member


  GET#retrieve member:
    - URL: http://cratebind-challenge-api.com/memd/members/:id
    - Response will be the member


  - Feel free to construct this integration however you like. When we are finished,
    we'll use the Rails console to interact with the MeMD API


- We'll need some way to easily:
    - create a MeMD Member
    - retrieve a MeMD Member


    - activate policies for a MeMD Member
      - Important: It is possible to "double activate" policies. We'll need to verify that a member
        is deactivated before calling activate on their policies
    - terminate policies for a MeMD Member
      - There are no problems with calling terminate on a member with terminated policies


