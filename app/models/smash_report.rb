class SmashReport < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'smash_reports'
end
