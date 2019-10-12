module Api
  module V1
    class PeopleController < ApplicationController
      before_action :find_person, only: %i[show update destroy]

      def index
        render json: Person.all, each_serializer: IndexPersonSerializer
      end

      def show
        render json: @person
      end

      def create
        person = Person.create(permitted_params)
        if person.errors.present?
          render json: person.errors, status: :bad_request
        else
          render json: person
        end
      end

      def update
        @person.update(permitted_params)
        if @person.errors.present?
          render json: @person.errors, status: :bad_request
        else
          render json: @person
        end
      end

      def destroy
        @person.destroy
        if @person.destroyed?
          render body: nil, status: :no_content
        else
          render json: @person.errors, status: :bad_request
        end
      end

      private

      def find_person
        @person = Person.find_by(id: params[:id])
        render body: nil, status: :not_found if @person.blank?
      end

      def permitted_params
        params[:person].permit(:first_name, :last_name, :middle_name, :sex)
      end
    end
  end
end
