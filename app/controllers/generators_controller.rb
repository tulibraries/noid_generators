# frozen_string_literal: true

class GeneratorsController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  def index
    @generators = Generator.all.order(:name)
  end

  def show
    if alert.present?
      @selected_project = alert
    end
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
    @generator.with_lock do
      g = Generator.uncached { Generator.find(@generator.id) }
      version = @generator.lock_version
      last_date = Time.now.strftime("%m")
      if g.last_date == last_date
        new_noid = g.noid.to_i + 1
      else
        new_noid = 1
      end
      params[:generator]["noid"] = new_noid.to_s.rjust(6, "0")
      params[:generator]["last_date"] = last_date

      respond_to do |format|
        if @generator.update(generator_params)
          project = params[:generator]["project"]
          class_code = params[:generator]["class_code"]
          prefix = params[:generator]["prefix"]
          suffix = params[:generator]["suffix"]
          picture_code = params[:generator]["picture_code"]
          date_taken = params[:generator]["date_taken"]
          noid = params[:generator]["noid"]
          year = Time.zone.now.strftime("%Y")
          month = Time.zone.now.strftime("%m")
          if project.present? || (["Bulletin", "Mosley Photographs"].include? @generator.name)
            case @generator.name
            when "General"
              message = "NOID: " + "#{project}Z#{year}#{month}#{noid}"
            when "Oral Histories"
              message = "NOID: " + "#{project}JZ#{year}#{month}#{noid}"
            when "Templana (Complex)"
              message = "NOID: " + "#{project}X#{class_code}Z#{year}#{month}#{noid}"
            when "Bulletin"
              message = "NOID: " + "#{prefix}Z#{year}#{month}#{noid}#{suffix}"
            when "Mosley Photographs"
              message = "NOID: " + "BPA001X#{picture_code.upcase}#{date_taken}#{noid}"
            else
              return
            end

            @selected_project = params[:generator]["project"]
          else
            message = "Generator successfully updated."
          end

          flash[:notice] = message
          flash.keep(:notice)

          format.html { redirect_to @generator, alert: @selected_project }
          format.json { render :show, status: :ok, location: @generator }
        else
          format.html { render :show, notice: "Stale value. Pease try again." }
          format.json { render json: @generator.errors, status: :unprocessable_entity }
        end
      end
      rescue ActiveRecord::StaleObjectError
        flash[:notice] = "Noid value needs refresh. Please try again."
        @generator.reload
        render :show, notice: "Stale value. Pease try again."
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
      params.require(:generator).permit(:name, :noid, :last_date, :project, :projects, :class_code, :prefix, :suffix, :picture_code, :date_taken, :lock_version)
    end
end
