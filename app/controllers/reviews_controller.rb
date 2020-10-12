# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :save]

  def index
    @reviews = Review.all
  end

  def new
    if @current_user.admin?
      @type = params[:type]
    else
      render json: {}, status: :unauthorized
    end
  end

  def edit
    @id = params[:id]
  end

  def save
  end
end
