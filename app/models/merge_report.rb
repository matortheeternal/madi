class MergeReport < ActiveRecord::Base
  include Sortable, Filterable, ScopeHelpers

  # BOOLEAN FILTERS
  hash_scope :approved, alias: 'approved'
  value_scope :game
  value_scope :merge_version, alias: "version"
  search_scope :filename
  range_scope :record_count, :rating
  date_scope :created, :updated

  # ASSOCIATIONS
  belongs_to :user, :inverse_of => 'merge_reports'

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
