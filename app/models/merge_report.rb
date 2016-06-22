class MergeReport < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'merge_reports'
end
