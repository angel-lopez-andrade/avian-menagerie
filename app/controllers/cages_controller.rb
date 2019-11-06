class CagesController < ApplicationController
    def index
        @cages = Cage.all
        @cage_varieties = CageVariety.all
    end

    def show
        @cage = Cage.find(params[:id])
        @price = "$#{Cage.find(params[:id]).price / 100.00}"
        session = Stripe::Checkout::Session.create({
            cancel_url: "#{root_url}cages/#{params[:id]}",
            success_url: "#{root_url}cages",
            payment_method_types: ["card"],
            customer_email: current_user.email,
            line_items: [{
                name: @cage.name,
                description: @cage.description,
                amount: @cage.price,
                currency: "aud",
                quantity: 1
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    cage_id: @cage.id
                }
            }
        })
        @session_id = session.id
    end
end