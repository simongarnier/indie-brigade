class PasswordsController < Clearance::PasswordsController
  private
  def deliver_email(user)
    mail = ::ClearanceMailerWithMessageId.change_password(user)
    mail.message_id_in_header

    if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("4.2.0")
      mail.deliver_later
    else
      mail.deliver
    end
  end
end
