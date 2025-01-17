class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:update, :destroy]

  # GET /reviews
  def index
    reviews = current_user.reviews
    render json: reviews, status: :ok
  end

  # GET /reviews/:isbn
  def show_by_isbn
    reviews = Review.where(isbn: params[:isbn])

    if reviews.exists?
      score = calculate_rating(reviews.pluck(:rating))
      render json: score, status: :ok
    else
      render json: { error: "No reviews found for the given ISBN" }, status: :not_found
    end
  end

  # POST /reviews
  def create
    review = current_user.reviews.new(review_params)
    if review.save
      render json: review, status: :created
    else
      render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /reviews/:id
  def update
    if @review.update(review_params)
      render json: @review, status: :ok
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy
    head :no_content
  end

  private

  def set_review
    @review = current_user.reviews.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Review not found' }, status: :not_found
  end

  def review_params
    params.require(:review).permit(:isbn, :rating)
  end

  def calculate_rating(reviews)
    return { rating: 0.0 } if reviews.empty?

    average_score = reviews.sum.to_f / reviews.size
    { rating: average_score.round(2) }
  end
end

