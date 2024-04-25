class User < ApplicationRecord

  # name validation
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  before_save :firstname_capitalize, :lastname_capitalize

  # email validation
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  #  password validation
  has_secure_password

  # account status (learner or teacher)
  enum status: { learner: 0, teacher: 1 }

  # custom validators
  def firstname_capitalize
    self.firstname = self.firstname.capitalize
  end

  def lastname_capitalize
    self.lastname = self.lastname.capitalize
  end
end
