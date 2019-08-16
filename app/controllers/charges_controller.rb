class ChargesController < ApplicationController
  def success
  end

  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
    @donation = Donation.create(amount: @amount, user: current_user)
    TaxReceipt.create(number: rand(100000...500000), donation: @donation)
    @soldier_amount = User.where(role: 0).count
    User.where(role: 0).each { |s| SoldiersDonation.create( user: s, donation: @donation, amount_per_soldier: @soldier_amount / @amount)}
    redirect_to dashboard_donors_user_path(current_user), notice: "Your Donation of $#{helpers.number_with_precision(@donation.amount, :precision => 2, :delimiter => ',')} has been sent!"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
