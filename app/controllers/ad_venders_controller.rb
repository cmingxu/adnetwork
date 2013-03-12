class AdVendersController < ApplicationController
  # GET /ad_venders
  # GET /ad_venders.json
  def index
    @ad_venders = AdVender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_venders }
    end
  end

  def export
    @ad_vender = AdVender.find(params[:id])
    send_file @ad_vender.artworks_package
  end

  def indexOfSize
    @ad_venders = AdVender.tagged_with params[:size]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_venders }
    end

  end

  # GET /ad_venders/new
  # GET /ad_venders/new.json
  def new
    @ad_vender = AdVender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_vender }
    end
  end

  # GET /ad_venders/1/edit
  def edit
    @ad_vender = AdVender.find(params[:id])
  end

  # POST /ad_venders
  # POST /ad_venders.json
  def create
    params[:ad_vender][:artwork_size_list] = params['hidden-ad_vender'][:artwork_size_list]
    @ad_vender = AdVender.new(params[:ad_vender])

    respond_to do |format|
      if @ad_vender.save
        format.html { redirect_to @ad_vender, notice: 'Ad vender was successfully created.' }
        format.json { render json: ad_venders_path, status: :created, location: @ad_vender }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_vender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_venders/1
  # PUT /ad_venders/1.json
  def update
    @ad_vender = AdVender.find(params[:id])
    params[:ad_vender][:artwork_size_list] = params['hidden-ad_vender'][:artwork_size_list]

    respond_to do |format|
      if @ad_vender.update_attributes(params[:ad_vender])
        format.html { redirect_to ad_venders_path, notice: 'Ad vender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_vender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_venders/1
  # DELETE /ad_venders/1.json
  def destroy
    @ad_vender = AdVender.find(params[:id])
    @ad_vender.destroy

    respond_to do |format|
      format.html { redirect_to ad_venders_url }
      format.json { head :no_content }
    end
  end
end
