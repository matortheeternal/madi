class MatorSmashStatisticsController < ApplicationController
  before_action :set_mator_smash_statistic, only: [:show, :edit, :update, :destroy]

  # GET /mator_smash_statistics
  def index
    @mator_smash_statistics = MatorSmashStatistic.all
  end

  # GET /mator_smash_statistics/1
  def show
  end

  # POST /mator_smash_statistics
  def create
    @mator_smash_statistic = MatorSmashStatistic.new(mator_smash_statistic_params)

    if @mator_smash_statistic.save
      redirect_to @mator_smash_statistic, notice: 'Mator smash statistic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mator_smash_statistics/1
  def update
    if @mator_smash_statistic.update(mator_smash_statistic_params)
      redirect_to @mator_smash_statistic, notice: 'Mator smash statistic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mator_smash_statistics/1
  def destroy
    @mator_smash_statistic.destroy
    redirect_to mator_smash_statistics_url, notice: 'Mator smash statistic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mator_smash_statistic
      @mator_smash_statistic = MatorSmashStatistic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mator_smash_statistic_params
      params.require(:mator_smash_statistic).permit(:user_id, :times_run, :patches_built, :settings_created, :plugins_smashed, :reports_submitted, :settings_submitted)
    end
end
