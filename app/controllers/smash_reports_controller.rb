class SmashReportsController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /smash_reports
  def index
    @smash_reports = SmashReport.accessible_by(current_ability).filter(filtering_params)
    respond_to do |format|
      format.html
      format.json { render :json => @smash_reports }
    end
  end

  # GET /smash_reports/1
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @smash_report}
    end
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
    # Only allow a trusted parameter "white list" through.
    def smash_report_params
      params.require(:smash_report).permit(:submitted_by, :approved, :smash_setting_id, :game, :filename, :hash, :record_count, :smash_version, :notes, :approved_at)
    end

    def filtering_params
      params[:filters].slice(:approved, :game, :search, :record_count, :version, :created, :updated)
    end
end
