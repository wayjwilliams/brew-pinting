class PintsController < ApplicationController
  before_action :set_pint, only: [:show, :edit, :update, :destroy]

  def index
    @pints = Pint.all
  end

  def show
  end

  def new
    @pint = Pint.new
  end

  def edit
  end

  def create
    @pint = Pint.new(pint_params)
    if @pint.save
      redirect_to @pint, notice: 'Pint was successfully created!'
    else
      render action: 'new'
    end
  end


  def update
    if @pint.update(pint_params)
      redirect_to @pint, notice: 'Pint was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pint.destroy
    redirect_to pints_url, notice: 'Pint was successfully destroyed.'
  end

  private
    def set_pint
      @pint = Pint.find(params[:id])
    end

    def pint_params
      params.require(:pint).permit(:description)
    end
end
