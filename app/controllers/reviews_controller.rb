# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    if @current_user.nil? || @current_user.admin?
      @type = params[:type]
    else
      render json: {}, status: :unauthorized
    end
  end

  def edit
    @id = params[:id]
  end

  def create
    redirect_to reviews_path
  end
end
