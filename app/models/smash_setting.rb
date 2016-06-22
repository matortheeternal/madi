class SmashSetting < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'smash_settings'
end
