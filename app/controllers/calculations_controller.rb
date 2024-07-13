class CalculationsController < ApplicationController
  def new_square
    render({ :template => "calculations/new_square" })
  end

  def calculate_square
    @number = params.fetch("number").to_f
    @square = @number ** 2
    render({ :template => "calculations/square_results" })
  end

  def new_square_root
    render({ :template => "calculations/new_square_root" })
  end

  def calculate_square_root
    @number = params.fetch("number").to_f
    @square_root = Math.sqrt(@number)
    render({ :template => "calculations/square_root_results" })
  end

  def new_payment
    render({ :template => "calculations/new_payment" })
  end

  def calculate_payment
    apr = params.fetch("apr").to_f
    @apr = apr.to_fs(:percentage, { precision: 4 })
    monthly_interest_rate = apr/100/12
  
    @years = params.fetch("years").to_i
    num_monthly_payments = @years * 12
  
    principal = params.fetch("principal").to_f
    @principal = principal.to_fs(:currency)
  
    numerator = monthly_interest_rate * principal
    denominator = 1 - (1 + monthly_interest_rate)**-num_monthly_payments
    @payment = (numerator/denominator).to_fs(:currency)

    render({ :template => "calculations/payment_results" })
  end

  def new_random
    render({ :template => "calculations/new_random" })
  end

  def calculate_random
    @min = params.fetch("min").to_i
    @max = params.fetch("max").to_i
    @random_number = rand(@min..@max)
    render({ :template => "calculations/random_results" })
  end
end
