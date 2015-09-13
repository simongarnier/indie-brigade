ActiveAdmin.register_page "Super Admin Dashboard", namespace: :super_admin do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Skills" do
          ul do
            Skill.all.map do |skill|
              li link_to(skill.long_name, super_admin_skill_path(skill))
            end
          end
        end
        panel "Users" do
          ul do
            User.all.map do |user|
              li link_to(user.email, super_admin_user_path(user))
            end
          end
        end
      end
    end


  end # content
end
