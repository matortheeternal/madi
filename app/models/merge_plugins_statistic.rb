class MergePluginsStatistic < ActiveRecord::Base
  include Sortable, Filterable

  belongs_to :user, :inverse_of => 'merge_plugins_statistic'
end
