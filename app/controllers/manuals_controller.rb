class ManualsController < ApplicationController

  def index
  end
  def new
    @manual = Manual.new
  end

  def create
    @manual = Manual.new(manual_params)
    @manual.state = :draft

    if @manual.save
      redirect_to root_path
    else
      render :new
    end
  end
end
