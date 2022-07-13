# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

alice_account = Account.create(first_name: 'Alice', last_name: 'James', account_status: 'active', has_dependents: true)
alice = Member.create(first_name: 'Alice', last_name: 'James', gender: 'female', relationship: 'primary', account_id: alice_account.id, dob: Date.today - 28.years)
Address.create(is_type: 'home', street_1: '35 Palm Way', street_2: '', city: 'Santa Rosa Beach', state: 'FL', zipcode: '32459', member_id: alice.id)
Member.create(first_name: 'Janius', last_name: 'James', gender: 'female', relationship: 'dependent', account_id: alice_account.id, dob: Date.today - 6.years)

josh_account = Account.create(first_name: 'Josh', last_name: 'Felts', account_status: 'active', has_dependents: true)
josh = Member.create(first_name: 'Josh', last_name: 'Felts', gender: 'male', relationship: 'primary', account_id: josh_account.id, dob: Date.today - 35.years)
Address.create(is_type: 'home', street_1: '22 Bruntz Circle', street_2: '', city: 'Dallas', state: 'TX', zipcode: '75001', member_id: josh.id)
Member.create(first_name: 'Janna', last_name: 'Felts', gender: 'female', relationship: 'dependent', account_id: josh_account.id, dob: Date.today - 4.years)
Member.create(first_name: 'Jason', last_name: 'Felts', gender: 'male', relationship: 'dependent', account_id: josh_account.id, dob: Date.today - 8.years)
Member.create(first_name: 'Jessica', last_name: 'Felts', gender: 'female', relationship: 'dependent', account_id: josh_account.id, dob: Date.today - 9.years)


alexia_account = Account.create(first_name: 'Alexia', last_name: 'Morgan', account_status: 'future', has_dependents: true)
alexia = Member.create(first_name: 'Alexia', last_name: 'Morgan', gender: 'female', relationship: 'primary', account_id: alexia_account.id, dob: Date.today - 35.years)
Address.create(is_type: 'home', street_1: '893 View Blvd', street_2: '', city: 'Orlando', state: 'FL', zipcode: '32789', member_id: alexia.id)
Address.create(is_type: 'mailing', street_1: '4428 Business Way', street_2: 'PO Box 123', city: 'Orlando', state: 'FL', zipcode: '32789', member_id: alexia.id)
Member.create(first_name: 'Joe', last_name: 'Morgan', gender: 'male', relationship: 'dependent', account_id: alexia_account.id, dob: Date.today - 36.years)
Member.create(first_name: 'Stephanie', last_name: 'Morgan', gender: 'female', relationship: 'dependent', account_id: alexia_account.id, dob: Date.today - 12.years)
Member.create(first_name: 'Becca', last_name: 'Morgan', gender: 'female', relationship: 'dependent', account_id: alexia_account.id, dob: Date.today - 11.years)


