class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy]

  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
    @random_number = 1 + rand(10)
    @result = Number.compare_numbers(@number.input, @random_number)
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end


  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)
    respond_to do |format|
      if @number.save
        format.html { redirect_to @number}
      else
        format.html { render :new }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:input)
    end
end
