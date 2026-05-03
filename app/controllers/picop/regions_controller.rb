class Picop::RegionsController < Picop::BaseController
  before_action :set_region, only: %i[ show edit update destroy ]

  def index
    @regions = Region.order(:name)
  end

  def show
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to picop_region_path(@region)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @region.update(region_params)
      redirect_to picop_region_path(@region), status: :see_other, notice: "Region has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @region.destroy
    redirect_to picop_regions_path
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.expect(region: [ :name ])
    end
end
