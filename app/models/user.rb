class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :password, :password_confirmation

  has_secure_password

  before_save { self.email = self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_many :sessions, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :albums
  has_many :comments
  has_many :user_comment_votes
  has_many :user_image_votes
  has_many :password_resets

  def send_password_reset_email
    token = password_resets.create!
    UserMailer.password_reset(self, token).deliver
  end
end
