class SnacksController < ApplicationController
    def index
        @snacks = Snack.all
        @snack_varieties = SnackVariety.all
    end

    def show
        @snack = Snack.find(params[:id])
        @price = "$#{Snack.find(params[:id]).price / 100.00}"
        session = Stripe::Checkout::Session.create({
            cancel_url: "#{root_url}snacks/#{params[:id]}",
            success_url: "#{root_url}payments/success",
            payment_method_types: ["card"],
            customer_email: current_user.email,
            line_items: [{
                name: @snack.name,
                description: @snack.description,
                amount: @snack.price,
                currency: "aud",
                quantity: 1
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    bird_id: @snack.id
                }
            }
        })
        @session_id = session.id
    end
end