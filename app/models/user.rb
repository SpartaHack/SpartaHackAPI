class User < ActiveRecord::Base
  validates :auth_token, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_authentication_token!

  def generate_authentication_token!
    loop do 
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end

  ROLES = %i[director judge mentor sponsor organizer volunteer hacker]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.role = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((role.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

end