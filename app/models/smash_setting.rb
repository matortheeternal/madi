class SmashSetting < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'submitted_by', :primary_key => 'username', :inverse_of => 'smash_settings'
end
