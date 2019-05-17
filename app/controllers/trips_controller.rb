# frozen_string_literal: true

class TripsController < ApplicationController
  expose :trips, -> { current_user.trips }
  expose :trip

  def create
    trip.user_id = current_user.id
    if trip.save
      redirect_to trip_path(trip)
    else
      render :new
    end
  end

  def update
    if trip.update(trip_params)
      redirect_to trip_path(trip)
    else
      render :edit
    end
  end

  def destroy
    trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title,
                                 :description,
                                 :country,
                                 :city,
                                 :start_date,
                                 :end_date,
                                 :user_id)
  end
end
