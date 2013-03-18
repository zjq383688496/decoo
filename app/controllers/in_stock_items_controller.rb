class InStockItemsController < ApplicationController
  # GET /in_stock_items
  # GET /in_stock_items.json
  def index
    @items = InStockItem.all
    @item=InStockItem.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_stock_items }
    end
  end

  # GET /in_stock_items/1
  # GET /in_stock_items/1.json
  def show
    @in_stock_item = InStockItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_stock_item }
    end
  end

  # GET /in_stock_items/new
  # GET /in_stock_items/new.json
  def new
    @in_stock_item = InStockItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @in_stock_item }
    end
  end

  # GET /in_stock_items/1/edit
  def edit
    @in_stock_item = InStockItem.find(params[:id])
  end

  # POST /in_stock_items
  # POST /in_stock_items.json
  def create
    @in_stock_item = InStockItem.new(params[:in_stock_item])
    
    respond_to do |format|
      if @in_stock_item.save
        
        format.html { redirect_to @in_stock_item, notice: 'In stock item was successfully created.' }
        format.json { render json: @in_stock_item, status: :created, location: @in_stock_item }
        format.js   
      else
        format.html { render action: "new" }
        format.json { render json: @in_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /in_stock_items/1
  # PUT /in_stock_items/1.json
  def update
    @in_stock_item = InStockItem.find(params[:id])

    respond_to do |format|
      if @in_stock_item.update_attributes(params[:in_stock_item])
        format.html { redirect_to @in_stock_item, notice: 'In stock item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @in_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_stock_items/1
  # DELETE /in_stock_items/1.json
  def destroy
    @in_stock_item = InStockItem.find(params[:id])
    @in_stock_item.destroy

    respond_to do |format|
      format.html { redirect_to in_stock_items_url }
      format.json { head :no_content }
    end
  end
end
