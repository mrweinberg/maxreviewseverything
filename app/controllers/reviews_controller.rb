# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    if current_user.present? && current_user.admin?
      @type = params[:type]
    else
      redirect_to reviews_path
    end
  end

  def show
    if current_user.present? && current_user.admin?
      @id = params[:id]
      @review = params[:review]
      @type = @review.type
    else
      redirect_to reviews_path
    end
  end

  def create
    ReviewService.create_review(params) if current_user.present? && current_user.admin?

    redirect_to reviews_path
  end

  def update
    ReviewService.update_review(params) if current_user.present? && current_user.admin?

    redirect_to reviews_path
  end

  def delete
    Review.find(params[:id]).destroy if current_user.present? && current_user.admin?

    redirect_to reviews_path
  end
end
