# Visable Bank

Steps to run project
 
 1. Clone this project
 2. Install dependencies by this command `bundle install`
 3. Setup database by this command `rails db:create db:migrate db:seed`
 4. Run `rails s` to start development server
 5. Open `http://localhost:3000/api_docs` in browser to view api documentation (username: `developer` and password: `password`)
 6. Send get request to `http://localhost:3000/api/accounts/balance?user_id=1` to get user balance
 4. Send post request to `http://localhost:3000/api/accounts/transfer` to transfer amount, it required three parameters: `from_user_id`, `to_user_id` and `amount`
 
 To run Rspec tests run `rspec`