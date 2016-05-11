class UsersController < Clearance::UsersController
  before_action :ensure_user_is_logged_in, only: [:edit, :update]

  def edit
    @user = current_user
  end

  def update
    old_password = user_params.delete(:old_password)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    cpassword = user_params.delete(:cpassword)
    user = User.authenticate(current_user.email, old_password)

    if user
      if !email.blank? && !User.find_by_normalized_email(email)
        user.email = email
        user.save
      end
      if !password.blank? && password == cpassword
        user.password = password
        user.save
      end
    end

    redirect_to user_edit_path
  end

  def create
    @user = user_from_params

    skill = Skill.find(@main_skill_id)
    if  @user.password == @cpassword && @confirm && verify_recaptcha(model: @user) && @user.save && skill
      sign_in @user
      dev = Dev.new
      dev.user = @user
      dev.main_skill = skill
      dev.role = skill.role
      dev.save
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
    dev = user_params.delete(:dev)
    @main_skill_id = dev[:main_skill_id]

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
