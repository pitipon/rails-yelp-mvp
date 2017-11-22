class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :create]

  # GET /reviews
  # GET /reviews.json
  # def index
  #   @reviews = Review.all
  # end

  def new
    # we need @restaurant in our `simple_form_for`
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  # def show
  # end

  # GET /reviews/new
  # def new
  #   @review = Review.new
  # end

  # GET /reviews/1/edit
  # def edit
  # end

  # POST /reviews
  # POST /reviews.json
  # def create
  #   @review = Review.new(review_params)
  #
  #   respond_to do |format|
  #     if @review.save
  #       format.html { redirect_to @review, notice: 'Review was successfully created.' }
  #       format.json { render :show, status: :created, location: @review }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  # def destroy
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end


    # Use callbacks to share common setup or constraints between actions.
    # def set_review
    #   @review = Review.find(params[:id])
    # end

    # def review_params
    #   params.require(:review).permit(:content)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
