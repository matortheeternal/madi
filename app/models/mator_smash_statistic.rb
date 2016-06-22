class MatorSmashStatistic < ActiveRecord::Base
  include Sortable, Filterable

  belongs_to :user, :inverse_of => 'mator_smash_statistic'
end
