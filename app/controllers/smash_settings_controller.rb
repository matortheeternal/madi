class SmashSettingsController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /smash_settings
  def index
    @smash_settings = SmashSetting.accessible_by(current_ability).filter(filtering_params)
    respond_to do |format|
      format.html
      format.json {
        render :json => @smash_settings.as_json({
          :only => [:name, :setting_hash, :description, :created_at, :updated_at],
          :include => {
              :user => {
                  :only => [:username]
              }
          }
        })
      }
    end
  end

  # GET /smash_settings/1
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @smash_setting}
    end
  end

  # POST /smash_settings
  def create
    @smash_setting = SmashSetting.new(smash_setting_params)

    if @smash_setting.save
      redirect_to @smash_setting, notice: 'Smash setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /smash_settings/1
  def update
    if @smash_setting.update(smash_setting_params)
      redirect_to @smash_setting, notice: 'Smash setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /smash_settings/1
  def destroy
    @smash_setting.destroy
    redirect_to smash_settings_url, notice: 'Smash setting was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def smash_setting_params
      params.require(:smash_setting).permit(:submitted_by, :approved, :game, :name, :hash, :color, :records, :description, :tree)
    end

    def filtering_params
      params[:filters].slice(:approved, :game, :search, :records, :created, :updated)
    end
end
