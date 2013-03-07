class InStocksController < ApplicationController
  # GET /in_stocks
  # GET /in_stocks.json
  def index
    @in_stocks = InStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_stocks }
    end
  end

  # GET /in_stocks/1
  # GET /in_stocks/1.json
  def show
    @in_stock = InStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_stock }
    end
  end

  # GET /in_stocks/new
  # GET /in_stocks/new.json
  def new
    @in_stock = InStock.create { :user_id=>1 }
    @items=@in_stock.in_stock_items

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @in_stock }
    end
  end

  # GET /in_stocks/1/edit
  def edit
    @in_stock = InStock.find(params[:id])
  end

  # POST /in_stocks
  # POST /in_stocks.json
  def create
    @in_stock = InStock.new(params[:in_stock])

    respond_to do |format|
      if @in_stock.save
        format.html { redirect_to @in_stock, notice: 'In stock was successfully created.' }
        format.json { render json: @in_stock, status: :created, location: @in_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /in_stocks/1
  # PUT /in_stocks/1.json
  def update
    @in_stock = InStock.find(params[:id])

    respond_to do |format|
      if @in_stock.update_attributes(params[:in_stock])
        format.html { redirect_to @in_stock, notice: 'In stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_stocks/1
  # DELETE /in_stocks/1.json
  def destroy
    @in_stock = InStock.find(params[:id])
    @in_stock.destroy

    respond_to do |format|
      format.html { redirect_to in_stocks_url }
      format.json { head :no_content }
    end
  end
end
