class User < ApplicationRecord

  # name validation
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  before_save :firstname_capitalize, :lastname_capitalize

  # email validation
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_save :downcase_email

  #  password validation
  has_secure_password
  validates :password, length: { minimum: 6 }

  # account status (learner or teacher)
  enum status: { learn: 0, educate: 1 }
  validates :status, presence: true

  # custom validators
  def firstname_capitalize
    self.firstname = self.firstname.capitalize
  end

  def lastname_capitalize
    self.lastname = self.lastname.capitalize
  end

  def downcase_email
    sef.email = self.email.downcase
  end
end
