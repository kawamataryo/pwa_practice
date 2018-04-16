class MyLikesController < ApplicationController
  before_action :set_my_like, only: [:show, :edit, :update, :destroy]

  # GET /my_likes
  # GET /my_likes.json
  def index
    @my_likes = MyLike.all
  end

  # GET /my_likes/1
  # GET /my_likes/1.json
  def show
  end

  # GET /my_likes/new
  def new
    @my_like = MyLike.new
  end

  # GET /my_likes/1/edit
  def edit
  end

  # POST /my_likes
  # POST /my_likes.json
  def create
    @my_like = MyLike.new(my_like_params)

    respond_to do |format|
      if @my_like.save
        format.html { redirect_to @my_like, notice: 'My like was successfully created.' }
        format.json { render :show, status: :created, location: @my_like }
      else
        format.html { render :new }
        format.json { render json: @my_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_likes/1
  # PATCH/PUT /my_likes/1.json
  def update
    respond_to do |format|
      if @my_like.update(my_like_params)
        format.html { redirect_to @my_like, notice: 'My like was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_like }
      else
        format.html { render :edit }
        format.json { render json: @my_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_likes/1
  # DELETE /my_likes/1.json
  def destroy
    @my_like.destroy
    respond_to do |format|
      format.html { redirect_to my_likes_url, notice: 'My like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_like
      @my_like = MyLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_like_params
      params.require(:my_like).permit(:name, :fruit)
    end
end
