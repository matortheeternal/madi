class BlacklistEntriesController < ApplicationController
  before_action :set_blacklist_entry, only: [:show, :edit, :update, :destroy]

  # GET /blacklist_entries
  def index
    @blacklist_entries = BlacklistEntry.all
  end

  # GET /blacklist_entries/1
  def show
  end

  # GET /blacklist_entries/new
  def new
    @blacklist_entry = BlacklistEntry.new
  end

  # GET /blacklist_entries/1/edit
  def edit
  end

  # POST /blacklist_entries
  def create
    @blacklist_entry = BlacklistEntry.new(blacklist_entry_params)

    if @blacklist_entry.save
      redirect_to @blacklist_entry, notice: 'Blacklist entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blacklist_entries/1
  def update
    if @blacklist_entry.update(blacklist_entry_params)
      redirect_to @blacklist_entry, notice: 'Blacklist entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blacklist_entries/1
  def destroy
    @blacklist_entry.destroy
    redirect_to blacklist_entries_url, notice: 'Blacklist entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blacklist_entry
      @blacklist_entry = BlacklistEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blacklist_entry_params
      params.require(:blacklist_entry).permit(:ip, :username, :created, :expires)
    end
end
