class User < ActiveRecord::Base
  include Sortable, Filterable, ScopeHelpers

  # Include devise modules
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  # ATTRIBUTES
  attr_accessor :login

  # SCOPES
  search_scope :username
  date_scope :joined, :last_seen

  # ASSOCIATIONS
  has_one :mator_smash_statistic, :inverse_of => 'user', :dependent => :destroy
  has_one :merge_plugins_statistic, :inverse_of => 'user', :dependent => :destroy
  has_many :merge_reports, :inverse_of => 'user', :dependent => :destroy
  has_many :smash_reports, :inverse_of => 'user', :dependent => :destroy
  has_many :smash_settings, :inverse_of => 'user', :dependent => :destroy

  # VALIDATIONS
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  
  validate :validate_username

  def admin?
    self.role.to_sym == :admin
  end

  def confirmed?
    self.confirmed_at.present?
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def as_json(options={})
    if JsonHelpers.json_options_empty(options)
      default_options = {
          :except => [:id],
          :include => {
              :mator_smash_statistic => {
                  :except => [:id, :user_id]
              },
              :merge_plugins_statistic => {
                  :except => [:id, :user_id]
              }
          }
      }
      super(options.merge(default_options))
    else
      super(options)
    end
  end
end
