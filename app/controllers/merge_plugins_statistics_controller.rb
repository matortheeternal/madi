class MergePluginsStatisticsController < ApplicationController
  before_action :set_merge_plugins_statistic, only: [:show, :update]

  # POST /merge_plugins_statistics/index
  def index
    render json: IndexDecorator.new(MergePluginsStatistic, [:user], self)
  end

  # GET /merge_plugins_statistics/1
  def show
    authorize! :read, @merge_plugins_statistic
    render json: @merge_plugins_statistic
  end

  # PATCH/PUT /merge_plugins_statistics/1
  def update
    update_record(@merge_plugins_statistic, merge_plugins_statistic_params)
  end

  # Only allow a trusted parameter "white list" through.
  def merge_plugins_statistic_params
    params.require(:merge_plugins_statistic).permit(:user_id, :times_run, :merges_built, :plugins_checked, :plugins_fixed, :plugins_merged, :reports_submitted)
  end

  def filtering_params
    (params[:filters] || {}).slice(:times_run, :merges_built, :plugins_checked, :plugins_fixed, :plugins_merged, :reports_submitted, :created, :updated)
  end

  private
    def set_merge_plugins_statistic
      @merge_plugins_statistic = MergePluginsStatistic.find(params[:id])
    end
end
