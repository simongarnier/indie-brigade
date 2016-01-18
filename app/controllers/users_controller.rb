class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.password == @cpassword && @confirm && verify_recaptcha(model: @user) && @user.save 
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def user_from_params
    firstname = user_params.delete(:firstname)
    lastname =user_params.delete(:lastname)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    @cpassword = user_params.delete(:cpassword)
    @confirm = user_params.delete(:confirm)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.firstname = firstname
      user.lastname = lastname
      user.email = email
      user.password = password
    end
  end

  def show
  end
end
