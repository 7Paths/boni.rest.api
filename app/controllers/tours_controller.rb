class ToursController < ApplicationController
    before_action :set_tour, only: [:show, :update, :destroy]

    # GET /tours
    def index
        respond_with_successful(Tour.all)
    end

    # GET /tours/1
    def show
        return respond_with_not_found unless @tour

        respond_with_successful(@tour)
    end

    # POST /tours
    def create
        tour = Tour.new(tour_params)

        if tour.save
            respond_with_successful(tour)
        else
            respond_with_error(tour.errors.full_messages.to_sentence)
        end
    end

    # PUT/PATCH /tours/1
    def update
        return respond_with_not_found unless @tour

        if tour.update(tour_params)
            respond_with_successful(tour)
        else
            respond_with_error(tour.errors.full_messages.to_sentence)
        end
    end

    # /tours/1
    def destroy
        return respond_with_not_found unless @tour

        if tour.destroy
            respond_with_successful(tour)
        else
            respond_with_error(tour.errors.full_messages.to_sentence)
        end
    end

    private

    def set_tour
        @tour = Tour.find_by_id(params[:id])
    end

    def tour_params
        params.fetch(:tour, {}).permit(:title, :description)
    end
end
