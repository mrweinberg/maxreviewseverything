# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    if current_user.present? && current_user.admin?
      @type = params[:type]
      details = Review.detail_class_for_type(params[:type]).new
      @review = Review.new(review_details: details)
    else
      redirect_to reviews_path
    end
  end

  def show
    if current_user.present? && current_user.admin?
      @id = params[:id]
      @review = Review.find(@id)
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

  def destroy
    Review.find(params[:id]).destroy if current_user.present? && current_user.admin?

    redirect_to reviews_path
  end
end
