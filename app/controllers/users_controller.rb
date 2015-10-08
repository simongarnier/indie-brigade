class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.password == @cpassword && @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    @cpassword = user_params.delete(:cpassword)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end
end
