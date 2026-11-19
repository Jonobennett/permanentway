class OperatorsController < ApplicationController
  def index
    @operators = Operator.order(:name)
  end

  def show
    @operator = Operator.find_by(code: params[:code])
    @stations = Current.user.stations.where(operator: @operator)
    @unvisited = @operator.stations.all.where.not(id: @stations)
  end
end
