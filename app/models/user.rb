class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessor :login

  has_one :mator_smash_statistic, :inverse_of => 'user'
  has_one :merge_plugins_statistic, :inverse_of => 'user'
  has_many :merge_reports, :foreign_key => 'submitted_by', :primary_key => 'username', :inverse_of => 'user'
  has_many :smash_reports, :foreign_key => 'submitted_by', :primary_key => 'username', :inverse_of => 'user'
  has_many :smash_settings, :foreign_key => 'submitted_by', :primary_key => 'username', :inverse_of => 'user'

  
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
end
