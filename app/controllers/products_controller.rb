# encoding: utf-8
class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    
    @product = Product.new
    w="1=1"
    o="id"
    @search=params[:search]
    if params[:search] and !params[:search].empty?
      w="title like ? or bh like ? ","%#{params[:search]}%","%#{params[:search]}%"
    end
    if params[:order] and !params[:order].empty?
      o="#{params[:order]}"
    end
    @products = Product.paginate(:page => params[:page], :per_page => 10).where(w).order(o)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout=>false } # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @specs=@product.specs
    @spec=Spec.new(:product_id=>@product.id,:bh=>"#{@product.bh}-")
    @materials=SpecProperty.material
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_product_url(@product), notice: '零件已成功创建.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @specs=@product.specs
    @spec=Spec.new(:product_id=>@product.id,:bh=>"#{@product.bh}-")
    @materials=SpecProperty.material
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: '数据已删除.' }
      format.json { head :no_content }
    end
  end

 
  
end
