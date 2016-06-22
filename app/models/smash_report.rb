class SmashReport < ActiveRecord::Base
  belongs_to :user, :inverse_of => 'smash_reports'
  belongs_to :smash_setting, :inverse_of => 'smash_reports'

  def as_json(options={})
    if JsonHelpers.json_options_empty(options)
      default_options = {
          :except => [:id, :user_id],
          :include => {
              :user => {
                  :only => [:username]
              }
          }
      }
      super(options.merge(default_options))
    else
      super(options)
    end
  end
end
