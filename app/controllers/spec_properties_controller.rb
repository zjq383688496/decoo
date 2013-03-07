class SpecPropertiesController < ApplicationController
  # GET /spec_properties
  # GET /spec_properties.json
  def index
    @spec_properties = SpecProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spec_properties }
    end
  end

  # GET /spec_properties/1
  # GET /spec_properties/1.json
  def show
    @spec_property = SpecProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spec_property }
    end
  end

  # GET /spec_properties/new
  # GET /spec_properties/new.json
  def new
    @spec_property = SpecProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spec_property }
    end
  end

  # GET /spec_properties/1/edit
  def edit
    @spec_property = SpecProperty.find(params[:id])
  end

  # POST /spec_properties
  # POST /spec_properties.json
  def create
    @spec_property = SpecProperty.new(params[:spec_property])

    respond_to do |format|
      if @spec_property.save
        format.html { redirect_to @spec_property, notice: 'Spec property was successfully created.' }
        format.json { render json: @spec_property, status: :created, location: @spec_property }
      else
        format.html { render action: "new" }
        format.json { render json: @spec_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spec_properties/1
  # PUT /spec_properties/1.json
  def update
    @spec_property = SpecProperty.find(params[:id])

    respond_to do |format|
      if @spec_property.update_attributes(params[:spec_property])
        format.html { redirect_to @spec_property, notice: 'Spec property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spec_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spec_properties/1
  # DELETE /spec_properties/1.json
  def destroy
    @spec_property = SpecProperty.find(params[:id])
    @spec_property.destroy

    respond_to do |format|
      format.html { redirect_to spec_properties_url }
      format.json { head :no_content }
    end
  end
end
