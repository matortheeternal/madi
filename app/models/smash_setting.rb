class SmashSetting < ActiveRecord::Base
  include Sortable, Filterable

  # BOOLEAN FILTERS
  hash_scope :approved, alias: 'approved'
  value_scope :game
  search_scope :name
  search_scope :records, alias: "records"
  date_scope :created, :updated

  # ASSOCIATIONS
  belongs_to :user, :inverse_of => 'smash_settings'
  has_many :smash_reports, :inverse_of => 'smash_setting'

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
