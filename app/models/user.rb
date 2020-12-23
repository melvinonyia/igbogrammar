class User < ApplicationRecord

  attr_reader :password

  # Validations
  validates :activation_token, :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :email,
            :password_digest,
            :session_token,
            :activation_token,
            presence: true

  after_initialize :ensure_session_token
  after_initialize :set_activation_token

  #has_many :reviews,
  #  foreign_key: :author_id

  #has_many :favorites
  #has_many :favorite_benches,
  #  through: :favorites,
  #  source: :bench

  # Find user
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  # Activation Token
  def set_activation_token
    self.activation_token = generate_unique_activation_token
  end

  # Create password
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # Check if password matches
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # Session Token
  def reset_session_token!
    generate_unique_session_token
    save!
    self.session_token
  end

  private

  def ensure_session_token
    generate_unique_session_token unless self.session_token
  end

  def new_session_token
    SecureRandom.urlsafe_base64
  end

  def generate_unique_session_token
    self.session_token = new_session_token

    ##
    # Just in case there is a session_token conflict, make sure
    # not to throw a validation error at the user!
    ##
    while User.find_by(session_token: self.session_token)
      self.session_token = new_session_token
    end

    self.session_token
  end

  ##
  # This method is for the mailer!
  ##
  def generate_unique_activation_token
    token = SecureRandom.urlsafe_base64(16)
    while self.class.exists?(activation_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end
    token
  end

  def activate!
    self.update_attribute(:activated, true)
  end

end
