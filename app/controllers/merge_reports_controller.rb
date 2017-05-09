class MergeReportsController < ApplicationController
  before_action :set_merge_report, only: [:show, :update, :destroy]

  # POST /merge_reports/index
  def index
    render json: IndexDecorator.new(MergeReport, [:user], self)
  end

  # GET /merge_reports/1
  def show
    render json: @merge_report
  end

  # POST /merge_reports
  def create
    create_record(MergeReport, merge_report_params)
  end

  # PATCH/PUT /merge_reports/1
  def update
    update_record(@merge_report, merge_report_params)
  end

  # DELETE /merge_reports/1
  def destroy
    destroy_record(@merge_report)
  end

  # Only allow a trusted parameter "white list" through.
  def merge_report_params
    params.require(:merge_report).permit(:submitted_by, :approved, :game, :filename, :hash, :record_count, :rating, :merge_version, :notes, :approved_at)
  end

  def filtering_params
    (params[:filters] || {}).slice(:approved, :game, :search, :record_count, :rating, :version, :created, :updated)
  end

  private
    def set_merge_report
      @merge_report = MergeReport.find(params[:id])
    end
end
