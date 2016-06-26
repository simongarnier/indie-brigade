class User < ActiveRecord::Base
  include Clearance::User

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :dev, presence: true
  validates :over_eighteen, acceptance: true, if: :validate_password?
  validate :password_must_follow_the_format, :password_must_match_cpassword, if: :validate_password?

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :organizations

  has_one :dev, dependent: :delete

  def password_must_follow_the_format
    if password_invalid?
      errors.add(:password, I18n.t('activerecord.errors.models.user.attributes.password.invalid'))
    end
  end

  def password_must_match_cpassword
    if password_invalid? && password_too_short?
      errors.add(:password, I18n.t('activerecord.errors.models.user.attributes.password.too_short_and_invalid'))
    elsif password_too_short?
      errors.add(:password, I18n.t('activerecord.errors.models.user.attributes.password.too_short'))
    elsif password_invalid?
      errors.add(:password, I18n.t('activerecord.errors.models.user.attributes.password.invalid'))
    end
  end

  def dev_must_be_present_with_a_skill
    unless dev.try(:main_skill) && dev.try(:role)
      errors.add(:skill, I18n.t('activerecord.errors.models.user.attributes.dev.skill'))
    end
  end

  def cpassword=(c)
    @cpassowrd = c
  end

  def validate_password=(n)
    @validate_password = n
  end

  def validate_password?
    @validate_password
  end

  private
  def password_invalid?
    /(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)/.match(password).nil?
  end

  def password_too_short?
    password.size < 8
  end
end
