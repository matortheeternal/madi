class MatorSmashStatistic < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'mator_smash_statistic'
end
