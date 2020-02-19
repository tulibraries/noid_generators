# frozen_string_literal: true

class GeneratorsController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  def index
    @generators = Generator.all
  end

  def show
  end

  def not_logged_in
  end

  def new
    @generator = Generator.new
  end

  def edit
  end

  def bulletin
    @generator = Generator.find_by(name: "Bulletin")
    redirect_to generator_path(@generator) unless @generator.nil?
  end

  def create
    @generator = Generator.new(generator_params)

    respond_to do |format|
      if @generator.save
        format.html { redirect_to @generator, notice: "Generator was successfully created." }
        format.json { render :show, status: :created, location: @generator }
      else
        format.html { render :new }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @generator.update(generator_params)
        project = params[:generator]["projects"]
        class_code = params[:generator]["class_code"]
        prefix = params[:generator]["prefix"]
        suffix = params[:generator]["suffix"]
        year = Time.zone.now.strftime("%Y")
        month = Time.zone.now.strftime("%m")
        noid = params[:generator]["noid"].rjust(5, "0")

        case @generator.name
        when "General"
          message = "NOID: " + "#{project}Z#{year}#{month}#{noid}"
        when "Oral Histories"
          noid = params[:generator]["noid"].rjust(3, "0")
          message = "NOID: " + "#{project}JZ#{year}#{month}#{noid}"
        when "Templana (Complex)"
          message = "NOID: " + "#{project}X#{class_code}Z#{year}#{month}#{noid}"
        when "Bulletin"
          message = "NOID: " + "#{prefix}Z#{year}#{month}#{noid}#{suffix}"
        else
          return
        end

        params[:generator]["project"] = project

        flash[:notice] = message
        flash.keep(:notice)

        format.html { redirect_to @generator }
        format.json { render :show, status: :ok, location: @generator }
      else
        format.html { render :edit }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @generator.destroy
    respond_to do |format|
      format.html { redirect_to generators_url, notice: "Generator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_generator
      @generator = Generator.find(params[:id])
    end

    def generator_params
      params.require(:generator).permit(:name, :noid, :last_date, :project, :class_code, :prefix, :suffix)
    end
end
