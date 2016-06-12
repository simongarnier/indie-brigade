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
    @user = User.authenticate(current_user.email, old_password)

    if @user
      if !email.blank? && !User.find_by_normalized_email(email)
        @user.email = email
      end
      if password.blank? && cpassword.blank?
        @user.password = old_password
        @user.cpassword = old_password
      else
        @user.password = password
        @user.cpassword = cpassword
      end
    end
    if @user && @user.save
      redirect_to user_edit_path
    else
      @user ||= current_user
      render template: "users/edit"
    end
  end

  def create
    @user = user_from_params
    # need to do this because it's the only way to inject recaptcha error in the model
    # running #valid? override errors previously injected
    user_validation_result = @user.valid?
    if verify_recaptcha(model: @user) && user_validation_result
      @user.save
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
    cpassword = user_params.delete(:cpassword)
    dev = user_params.delete(:dev)
    main_skill_id = dev[:main_skill_id]
    over_eighteen = user_params.delete(:over_eighteen)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.firstname = firstname
      user.lastname = lastname
      user.email = email
      user.password = password
      user.over_eighteen = over_eighteen
      user.cpassword = cpassword

      skill = Skill.find_by_id(main_skill_id)
      if skill
        user.dev = Dev.new(main_skill: skill, role: skill.role, user: user)
      end
    end
  end

  def show
  end
end
