class SmashReport < ActiveRecord::Base
  include Sortable, Filterable, ScopeHelpers

  # BOOLEAN FILTERS
  hash_scope :approved, alias: 'approved'
  value_scope :game
  value_scope :smash_version, alias: 'version'
  search_scope :filename
  range_scope :record_count
  date_scope :created, :updated

  # ASSOCIATIONS
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
