# encoding: utf-8
class SpecsController < ApplicationController
  # GET /specs
  # GET /specs.json
  def index
    @specs = Spec.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specs }
    end
  end

  # GET /specs/1
  # GET /specs/1.json
  def show
    @spec = Spec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spec }
    end
  end

  # GET /specs/new
  # GET /specs/new.json
  def new
    @spec = Spec.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spec }
    end
  end

  # GET /specs/1/edit
  def edit
    @spec = Spec.find(params[:id])
    @materials=SpecProperty.material
    @product=Product.find(params[:product_id])
    render :layout=>false
  end

  # POST /specs
  # POST /specs.json
  def create
    @product=Product.find(params[:product_id])
    if Color.find_by_bh(params[:spec][:color_bh]).nil?
      flash[:error]="规格创建失败！颜色编号#{params[:spec][:color_bh]}不存在."
      redirect_to edit_product_url(@product) and return
    end
    
    params[:spec][:material]=params[:spec][:material].join(",") if params[:spec][:material]
    @spec=@product.specs.build(params[:spec])
    respond_to do |format|
      if @spec.save
        format.html { redirect_to edit_product_url(@product), notice: '新规格已成功创建.' }
        format.json { render json: @spec, status: :created, location: @spec }
      else
        format.html { render action: "new" }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specs/1
  # PUT /specs/1.json
  def update
    @spec = Spec.find(params[:id])

    respond_to do |format|
      if @spec.update_attributes(params[:spec])
        format.html { redirect_to @spec, notice: 'Spec was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specs/1
  # DELETE /specs/1.json
  def destroy
    @spec = Spec.find(params[:id])
    
    @product=@spec.product
    @spec.destroy
    respond_to do |format|
      format.html { redirect_to edit_product_url(@product), notice: '规格已成功删除.' }
      format.json { head :no_content }
    end
  end
end
