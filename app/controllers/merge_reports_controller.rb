class MergeReportsController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /merge_reports
  def index
    @merge_reports = MergeReport.accessible_by(current_ability).filter(filtering_params)
    respond_to do |format|
      format.html
      format.json { render :json => @merge_reports }
    end
  end

  # GET /merge_reports/1
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @merge_report}
    end
  end

  # POST /merge_reports
  def create
    @merge_report = MergeReport.new(merge_report_params)

    if @merge_report.save
      redirect_to @merge_report, notice: 'Merge report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merge_reports/1
  def update
    if @merge_report.update(merge_report_params)
      redirect_to @merge_report, notice: 'Merge report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merge_reports/1
  def destroy
    @merge_report.destroy
    redirect_to merge_reports_url, notice: 'Merge report was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def merge_report_params
      params.require(:merge_report).permit(:submitted_by, :approved, :game, :filename, :hash, :record_count, :rating, :merge_version, :notes, :approved_at)
    end

    def filtering_params
      params[:filters].slice(:approved, :game, :search, :record_count, :rating, :version, :created, :updated)
    end
end
