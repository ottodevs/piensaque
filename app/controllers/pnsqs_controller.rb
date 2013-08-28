class PnsqsController < ApplicationController
  include SessionsHelper
  include ApplicationHelper

  # GET /pnsqs
  # GET /pnsqs.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pnsqs }
    end
  end

  # GET /pnsqs/1
  # GET /pnsqs/1.json
  def show
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @user }
    # end
  end

  # GET /pnsqs/new
  # GET /pnsqs/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
   
  end

  # GET /pnsqs/1/edit
  def edit
    
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end

  end

  # POST /pnsqs
  def create
    raise params.inspect
    @pnsq = Pnsq.new(params[:pnsq])


    respond_to do |format|
      format.html { redirect_to }
      format.js { render }
    end
  end

  # PUT /pnsqs/1
  # PUT /pnsqs/1.json
  def update
    @pnsq = Pnsq.find(params[:id])

    respond_to do |format|
      if @pnsq.update_attributes(params[:pnsq])
        format.html { redirect_to music_path, notice: 'Pnsq was successfully updated.' }
        format.js { redirect_to root_path }
      else
        format.html { render action: "edit" }
        format.js { render json: @pnsq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pnsqs/1
  # DELETE /pnsqs/1.json
  def destroy
    @pnsq = Pnsq.find(params[:id])
    @pnsq.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
