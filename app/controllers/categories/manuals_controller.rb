class Categories::ManualsController < ApplicationController
  def index
    def index
      @categories = Category.find(params[:category_id])
    end
  end
end
