class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: [error.message] }, status: :not_found
  end

  def index
    if search.present?
      @products = Product.search(search).sorted.page(params[:page])
    else
      @products = Product.sorted.page(params[:page])
    end

    paginate json: @products, except: [:created_at, :updated_at]
  end

  def show
    render json: @product, except: [:created_at, :updated_at]
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :price, :quantity,
    )
  end

  def search
    params[:search]
  end
end
