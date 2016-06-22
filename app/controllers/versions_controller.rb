class VersionsController < ApplicationController
  load_and_authorize_resource

  # GET /versions
  def index
    respond_to do |format|
      format.html
      format.json { render :json => @versions}
    end
  end

  # GET /versions/1
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @version}
    end
  end

  # POST /versions
  def create
    @version = Version.new(version_params)

    if @version.save
      redirect_to @version, notice: 'Version was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /versions/1
  def update
    if @version.update(version_params)
      redirect_to @version, notice: 'Version was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /versions/1
  def destroy
    @version.destroy
    redirect_to versions_url, notice: 'Version was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def version_params
      params.require(:version).permit(:label, :version)
    end
end
