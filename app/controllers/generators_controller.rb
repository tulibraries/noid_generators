# frozen_string_literal: true

class GeneratorsController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  def index
    @generators = Generator.all.order(:name)
  end

  def show
    if alert.present?
      @generator.project_id = alert
    elsif @generator.project.present?
      selected = @generator.projects.find { |p| "#{p.code}#{p.label}" == @generator.project }
      @generator.project_id = selected&.id
    end

    @generator.project_id ||= @generator.projects.first&.id
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
      @generator.reload
      current_month = Time.zone.now.strftime("%m")
      generated_noid = nil
      selected_project_id = params[:generator]["project_id"].presence
      project_record = nil

      if project_scoped_generator?(@generator)
        project_record = @generator.projects.find_by(id: selected_project_id)
        unless project_record
          flash[:notice] = "Select a project before generating a NOID."
          @generator.project_id = selected_project_id
          render :show and return
        end

        project_record.with_lock do
          project_record.reload
          next_noid = if project_record.last_date == current_month
            project_record.noid.to_i + 1
                      else
                        1
          end
          project_record.update!(noid: next_noid, last_date: current_month)
          generated_noid = next_noid.to_s.rjust(6, "0")
        end

        params[:generator]["project"] = "#{project_record.code}#{project_record.label}"
        params[:generator]["project_id"] = project_record.id
        params[:generator]["last_date"] = current_month
      else
        next_noid = if @generator.last_date == current_month
          @generator.noid.to_i + 1
                    else
                      1
        end
        generated_noid = next_noid.to_s.rjust(6, "0")
        params[:generator]["last_date"] = current_month
      end

      params[:generator]["noid"] = generated_noid

      respond_to do |format|
        if @generator.update(generator_params)
          @generator.project_id = params[:generator]["project_id"]
          project_identifier = params[:generator]["project"]
          class_code = params[:generator]["class_code"]
          prefix = params[:generator]["prefix"]
          suffix = params[:generator]["suffix"]
          picture_code = params[:generator]["picture_code"]
          date_taken = params[:generator]["date_taken"]
          noid = params[:generator]["noid"]
          year = Time.zone.now.strftime("%Y")
          month = Time.zone.now.strftime("%m")
          if project_identifier.present? || (["Bulletin", "Mosley Photographs"].include? @generator.name)
            case @generator.name
            when "General"
              message = "NOID: " + "#{project_identifier}Z#{year}#{month}#{noid}"
            when "Oral Histories"
              message = "NOID: " + "#{project_identifier}JZ#{year}#{month}#{noid}"
            when "Templana (Complex)"
              message = "NOID: " + "#{project_identifier}X#{class_code}Z#{year}#{month}#{noid}"
            when "Bulletin"
              message = "NOID: " + "#{prefix}Z#{year}#{month}#{noid}#{suffix}"
            when "Mosley Photographs"
              message = "NOID: " + "BPA001X#{picture_code.upcase}#{date_taken}#{noid}"
            else
              return
            end
          else
            message = "Generator successfully updated."
          end

          flash[:notice] = message
          flash.keep(:notice)

          alert_value = project_record&.id
          format.html { redirect_to @generator, alert: alert_value }
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
      params.require(:generator).permit(:name, :noid, :last_date, :project, :projects, :class_code, :prefix, :suffix, :picture_code, :date_taken, :lock_version, :project_id)
    end

    def project_scoped_generator?(generator)
      ["General", "Oral Histories", "Templana (Complex)"].include?(generator.name)
    end
end
