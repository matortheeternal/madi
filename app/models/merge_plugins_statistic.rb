class MergePluginsStatistic < ActiveRecord::Base
  include Sortable, Filterable, ScopeHelpers

  # SCOPES
  range_scope :times_run, :merges_built, :plugins_checked, :plugins_fixed, :plugins_merged, :reports_submitted
  date_scope :created_at, :updated_at

  # ASSOCIATIONS
  belongs_to :user, :inverse_of => 'merge_plugins_statistic'
end
