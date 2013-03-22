class VenderFeedbacksController < ApplicationController
  # GET /vender_feedbacks
  # GET /vender_feedbacks.json
  def index
    @vender_feedbacks = VenderFeedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vender_feedbacks }
    end
  end

  # GET /vender_feedbacks/1
  # GET /vender_feedbacks/1.json
  def show
    @vender_feedback = VenderFeedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vender_feedback }
    end
  end

  # GET /vender_feedbacks/new
  # GET /vender_feedbacks/new.json
  def new
    @vender_feedback = VenderFeedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vender_feedback }
    end
  end

  # GET /vender_feedbacks/1/edit
  def edit
    @vender_feedback = VenderFeedback.find(params[:id])
  end

  # POST /vender_feedbacks
  # POST /vender_feedbacks.json
  def create
    @vender_feedback = VenderFeedback.new(params[:vender_feedback])

    respond_to do |format|
      if @vender_feedback.save
        format.html { redirect_to @vender_feedback, notice: 'Vender feedback was successfully created.' }
        format.json { render json: @vender_feedback, status: :created, location: @vender_feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @vender_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vender_feedbacks/1
  # PUT /vender_feedbacks/1.json
  def update
    @vender_feedback = VenderFeedback.find(params[:id])

    respond_to do |format|
      if @vender_feedback.update_attributes(params[:vender_feedback])
        format.html { redirect_to @vender_feedback, notice: 'Vender feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vender_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vender_feedbacks/1
  # DELETE /vender_feedbacks/1.json
  def destroy
    @vender_feedback = VenderFeedback.find(params[:id])
    @vender_feedback.destroy

    respond_to do |format|
      format.html { redirect_to vender_feedbacks_url }
      format.json { head :no_content }
    end
  end
end
