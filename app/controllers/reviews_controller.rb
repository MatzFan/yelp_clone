class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviewss.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # GET /reviews/new
  def new
    # route is 'new_restautant_review', so need to define @restaurant and @review - IN THAT ORDER!
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @review = restaurant.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [restaurant, @review], notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }

      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review/1
  # DELETE /review/1.json
  # def destroy
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reviews_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content)
    end
end
