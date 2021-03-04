class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update ]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path(@property.id), notice: "物件情報を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property.id), notice: "物件情報を編集しました"
    else
      render :edit
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :rent, :adress, :age, :note)
  end
end
