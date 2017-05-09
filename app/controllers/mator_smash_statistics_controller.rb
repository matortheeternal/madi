class MatorSmashStatisticsController < ApplicationController
  before_action :set_mator_smash_statistic, only: [:show, :update]

  # POST /mator_smash_statistics/index
  def index
    render json: IndexDecorator.new(MatorSmashStatistic, [:user], self)
  end

  # GET /mator_smash_statistics/1
  def show
    authorize! :read, @mator_smash_statistic
    render json: @mator_smash_statistic
  end

  # PATCH/PUT /mator_smash_statistics/1
  def update
    update_record(@mator_smash_statistic, mator_smash_statistic_params)
  end

  # Only allow a trusted parameter "white list" through.
  def mator_smash_statistic_params
    params.require(:mator_smash_statistic).permit(:user_id, :times_run, :patches_built, :settings_created, :plugins_smashed, :reports_submitted, :settings_submitted)
  end

  def filtering_params
    (params[:filters] || {}).slice(:times_run, :patches_built, :plugins_checked, :settings_created, :plugins_smashed, :reports_submitted, :settings_submitted, :created, :updated)
  end

  private
    def set_mator_smash_statistic
      @mator_smash_statistic = MatorSmashStatistic.find(params[:id])
    end
end
