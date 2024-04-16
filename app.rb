require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num_2 = params.fetch("users_number_2").to_f
  @the_result_2 = Math.sqrt(@the_num_2)
  erb(:square_root_results)
end



get("/payment/new") do
  erb(:new_payment)
end


get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f
  @the_years = params.fetch("user_years").to_f

  @the_r = ((params.fetch("user_apr").to_f)/100)/12
  @the_n = (params.fetch("user_years").to_f)/12
  @the_princ = params.fetch("user_pv").to_f

  @numerator = @the_r * @the_princ

  @periods = @the_n * -1
  @changed_r = 1 + @the_r
  @r_power = @changed_r ** @periods
  @denominator = 1 - @r_power
  @the_result_payment = @numerator / @denominator
  
  erb(:payment_results)
end


get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min_val = params.fetch("user_min").to_f
  @max_val = params.fetch("user_max").to_f
  @rand_output = rand(@min_val..@max_val)
  erb(:random_results)
end




get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
