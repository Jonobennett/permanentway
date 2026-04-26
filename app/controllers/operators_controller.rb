class OperatorsController < ApplicationController
  def index
    @operators = Operator.order(:name)
  end

  def show
    @operator = Operator.find(params[:id])
  end
end
