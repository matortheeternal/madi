class MatorSmashStatistic < ActiveRecord::Base
  include Sortable, Filterable

  # SCOPES
  range_scope :times_run, :patches_built, :settings_created, :plugins_smashed, :reports_submitted, :settings_submitted
  date_scope :created_at, :updated_at

  # ASSOCIATIONS
  belongs_to :user, :inverse_of => 'mator_smash_statistic'
end
