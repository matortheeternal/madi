class MergePluginsStatisticsController < ApplicationController
  before_action :set_merge_plugins_statistic, only: [:show, :edit, :update, :destroy]

  # GET /merge_plugins_statistics
  def index
    @merge_plugins_statistics = MergePluginsStatistic.all
  end

  # GET /merge_plugins_statistics/1
  def show
  end

  # GET /merge_plugins_statistics/new
  def new
    @merge_plugins_statistic = MergePluginsStatistic.new
  end

  # GET /merge_plugins_statistics/1/edit
  def edit
  end

  # POST /merge_plugins_statistics
  def create
    @merge_plugins_statistic = MergePluginsStatistic.new(merge_plugins_statistic_params)

    if @merge_plugins_statistic.save
      redirect_to @merge_plugins_statistic, notice: 'Merge plugins statistic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /merge_plugins_statistics/1
  def update
    if @merge_plugins_statistic.update(merge_plugins_statistic_params)
      redirect_to @merge_plugins_statistic, notice: 'Merge plugins statistic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /merge_plugins_statistics/1
  def destroy
    @merge_plugins_statistic.destroy
    redirect_to merge_plugins_statistics_url, notice: 'Merge plugins statistic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merge_plugins_statistic
      @merge_plugins_statistic = MergePluginsStatistic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merge_plugins_statistic_params
      params.require(:merge_plugins_statistic).permit(:user_id, :times_run, :merges_built, :plugins_checked, :plugins_fixed, :plugins_merged, :reports_submitted)
    end
end
