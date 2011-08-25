class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :email, :type => String
  field :password_digest, :type => String

  attr_accessible :email
  attr_protected :password_digest

  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :if => :password
end
