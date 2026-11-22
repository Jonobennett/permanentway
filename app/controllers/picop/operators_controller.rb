class Picop::OperatorsController < Picop::BaseController
  before_action :set_operator, only: %i[ show edit update destroy ]

  def index
    @operators = Operator.order(:name)
  end

  def show
  end

  def new
    @operator = Operator.new
  end

  def create
    @operator = Operator.new(operator_params)
    if @operator.save
      redirect_to picop_operator_path(@operator)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @operator.update(operator_params)
      redirect_to picop_operator_path(@operator), status: :see_other, notice: "Operator has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @operator.destroy
    redirect_to picop_operators_path
  end

  private
    def set_operator
      @operator = Operator.find_by(params[:code])
    end

    def operator_params
      params.expect(operator: [ :name, :code ])
    end
end
