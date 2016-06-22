class SmashReport < ActiveRecord::Base
  include Sortable, Filterable

  # BOOLEAN FILTERS
  scope :approved, -> (bool) { where(approved: true) if bool }
  # GENERAL FILTERS
  scope :game, -> (game) { where(game: game) }
  scope :search, -> (search) { where("filename LIKE ?", "%#{search}%") }
  scope :record_count, -> (range) { where(record_count: range[:min]..range[:max]) }
  scope :version, -> (version) { where(smash_version: version) }
  scope :created, -> (range) { where(created_at: parseDate(range[:min])..parseDate(range[:max])) }
  scope :updated, -> (range) { where(updated_at: parseDate(range[:min])..parseDate(range[:max])) }

  belongs_to :user, :inverse_of => 'smash_reports'
  belongs_to :smash_setting, :inverse_of => 'smash_reports'

  def as_json(options={})
    if JsonHelpers.json_options_empty(options)
      default_options = {
          :except => [:id, :user_id],
          :include => {
              :user => {
                  :only => [:username]
              },
              :smash_setting => {
                  :only => [:id, :name, :setting_hash]
              }
          }
      }
      super(options.merge(default_options))
    else
      super(options)
    end
  end
end
