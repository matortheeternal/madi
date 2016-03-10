class MergePluginsStatistic < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'merge_plugins_statistic'
end
