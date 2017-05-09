class VersionsController < ApplicationController
  # GET /versions
  def index
    render json: Version.all
  end
end
