class SmashReportsController < ApplicationController
  before_action :set_smash_report, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /smash_reports
  def index
    @smash_reports = SmashReport.all
  end

  # GET /smash_reports/1
  def show
  end

  # POST /smash_reports
  def create
    @smash_report = SmashReport.new(smash_report_params)

    if @smash_report.save
      redirect_to @smash_report, notice: 'Smash report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /smash_reports/1
  def update
    if @smash_report.update(smash_report_params)
      redirect_to @smash_report, notice: 'Smash report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /smash_reports/1
  def destroy
    @smash_report.destroy
    redirect_to smash_reports_url, notice: 'Smash report was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smash_report
      @smash_report = SmashReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smash_report_params
      params.require(:smash_report).permit(:submitted_by, :approved, :smash_setting_id, :game, :filename, :hash, :record_count, :smash_version, :notes, :approved_at)
    end
end
