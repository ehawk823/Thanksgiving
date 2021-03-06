class HandlesController < ApplicationController
  before_action :set_handle, only: [:show, :edit, :update, :destroy]

  # GET /handles
  # GET /handles.json
  def index
    @handles = Handle.all
  end

  # GET /handles/1
  # GET /handles/1.json
  def show
    @tweets = @handle.tweets
    @tweets_num = @tweets.length
    @retweets = @handle.retweets
    @characters = @handle.characters
    @uris = @handle.uris
    @character_avg = @characters / @tweets_num
  end

  # GET /handles/new
  def new
    @handle = Handle.new
  end

  # GET /handles/1/edit
  def edit
  end

  # POST /handles
  # POST /handles.json
  def create
    @handle = Handle.new(handle_params)

    respond_to do |format|
      if @handle.save
        format.html { redirect_to @handle, notice: 'Handle was successfully created.' }
        format.json { render :show, status: :created, location: @handle }
      else
        format.html { render :new }
        format.json { render json: @handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /handles/1
  # PATCH/PUT /handles/1.json
  def update
    respond_to do |format|
      if @handle.update(handle_params)
        format.html { redirect_to @handle, notice: 'Handle was successfully updated.' }
        format.json { render :show, status: :ok, location: @handle }
      else
        format.html { render :edit }
        format.json { render json: @handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handles/1
  # DELETE /handles/1.json
  def destroy
    @handle.destroy
    respond_to do |format|
      format.html { redirect_to handles_url, notice: 'Handle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handle
      @handle = Handle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handle_params
      params.require(:handle).permit(:handle_name)
    end
end
