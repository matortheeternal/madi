class SmashSetting < ActiveRecord::Base
  include Sortable, Filterable

  # BOOLEAN FILTERS
  scope :approved, -> (bool) { where(approved: true) if bool }
  # GENERAL FILTERS
  scope :game, -> (game) { where(game: game) }
  scope :search, -> (search) { where("name LIKE ?", "%#{search}%") }
  scope :records, -> (records) { where("records LIKE ?", "%#{records}%") }
  scope :created, -> (range) { where(created_at: parseDate(range[:min])..parseDate(range[:max])) }
  scope :updated, -> (range) { where(updated_at: parseDate(range[:min])..parseDate(range[:max])) }


  belongs_to :user, :inverse_of => 'smash_settings'

  def as_json(options={})
    if JsonHelpers.json_options_empty(options)
      default_options = {
          :except => [:id, :user_id],
          :include => {
              :user => {
                  :only => [:username]
              }
          }
      }
      super(options.merge(default_options))
    else
      super(options)
    end
  end
end
