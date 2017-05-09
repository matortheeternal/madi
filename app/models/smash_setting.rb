class SmashSetting < ActiveRecord::Base
  include Sortable, Filterable, ScopeHelpers

  # BOOLEAN FILTERS
  hash_scope :approved, alias: 'approved'
  value_scope :game
  search_scope :name
  search_scope :records, alias: "records"
  date_scope :created, :updated

  # ASSOCIATIONS
  belongs_to :user, :inverse_of => 'smash_settings'
  has_many :smash_reports, :inverse_of => 'smash_setting'
end
