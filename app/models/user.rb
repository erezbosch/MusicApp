class User < ActiveRecord::Base
  before_validation :ensure_session_token
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :notes

  attr_reader :password

  def self.find_by_credentials(credentials)
    user = User.find_by(email: credentials[:email])
    return user if user && user.is_password?(credentials[:password])
    nil
  end

  def reset_session_token!
    self.session_token = generate_session_token
    save!
  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def is_password?(pwd)
    BCrypt::Password.new(password_digest).is_password?(pwd)
  end

  private

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
