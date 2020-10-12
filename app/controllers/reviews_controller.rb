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

  def edit
    @id = params[:id]
  end

  def create
    ReviewService.create_review(params)
    redirect_to reviews_path
  end
end
