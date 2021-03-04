class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to property_path(@property.id), notice: "物件情報を登録しました"
      else
        render :new
      end
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

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました"
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note)
  end
end
