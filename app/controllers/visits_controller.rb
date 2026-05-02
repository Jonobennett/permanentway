class VisitsController < ApplicationController
  before_action :set_visit, except: [ :new, :create ]

  def new
    @station = Station.find_by(crscode: params[:crscode])
    @visit = Visit.new(station: @station)
  end

  def edit
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user = Current.user
    if @visit.save
      redirect_to station_path(@visit.station.crscode)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if @visit.update(visit_params)
      redirect_to station_path(@visit.station.crscode)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @station = @visit.station
    @visit.destroy
    redirect_to station_path(@station.crscode)
  end

  private
  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.expect(visit: [ :station_id, :user_id, :visit_type, :visit_date ])
  end

  def new_params
    params.expect(visit: [ :crscode ])
  end
end
