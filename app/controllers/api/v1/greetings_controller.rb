module Api
  module V1
    class GreetingsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        greeting = Greeting.all

        render json: GreetingSerializer.new(greeting).serialized_json
      end

      def show
        greeting = Greeting.find(params[:id])

        render json: GreetingSerializer.new(greeting).serialized_json
      end

      def create
        greeting = Greeting.new(greeting_params)

        if greeting.save
          render json: GreetingSerializer.new(greeting).serialized_json
        else
          render json: { error: greeting.errors.message }, status: 422
        end
      end

      def update
        greeting = Greeting.new(greeting_params)

        if greeting.update(greeting_params)
          render json: GreetingSerializer.new(greeting).serialized_json
        else
          render json: { error: greeting.errors.message }, status: 422
        end
      end

      def destroy
        greeting = Greeting.find(params[:id])

        if greeting.destroy
          head :no_content
        else
          render json: { error: greeting.errors.message }, status: 422
        end
      end

      private

      def greeting_params
        params.require(:greeting).permit(:message)
      end
    end
  end
end
