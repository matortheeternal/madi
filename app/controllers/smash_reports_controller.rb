class SmashReportsController < ApplicationController
  before_action :set_smash_report, only: [:show, :update, :destroy]

  # GET /smash_reports
  def index
    render json: IndexDecorator.new(SmashReport, [:user], self)
  end

  # GET /smash_reports/1
  def show
    render json: @smash_report
  end

  # POST /smash_reports
  def create
    create_record(SmashReport, smash_report_params)
  end

  # PATCH/PUT /smash_reports/1
  def update
    update_record(@smash_report, smash_report_params)
  end

  # DELETE /smash_reports/1
  def destroy
    destroy_record(@smash_report)
  end

  # Only allow a trusted parameter "white list" through.
  def smash_report_params
    params.require(:smash_report).permit(:submitted_by, :approved, :smash_setting_id, :game, :filename, :hash, :record_count, :smash_version, :notes, :approved_at)
  end

  def filtering_params
    (params[:filters] || {}).slice(:approved, :game, :search, :record_count, :version, :created, :updated)
  end

  private
    def set_smash_report
      @smash_report = SmashReport.find(params[:id])
    end
end
