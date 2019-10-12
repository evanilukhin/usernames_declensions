module Api
  module V1
    class PeopleController < ApplicationController
      def index
        render json: Person.all
      end

      def show
        person = Person.find(params[:id])
        render json: person
      end
    end
  end
end
