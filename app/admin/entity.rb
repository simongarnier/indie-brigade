ActiveAdmin.register_page "Entities", namespace: :super_admin do

  menu priority: 1

  content do
    columns do
      column do
        Role.all.map do |role|
          panel link_to(role.code, super_admin_role_path(role)) do
            ul do
              role.skills.map do |skill|
                li link_to(skill.long_name, super_admin_skill_path(skill))
              end
            end
          end
        end
      end
      column do
        panel link_to('Softwares', super_admin_softwares_path) do
          ul do
            Software.all.map do |software|
              li link_to(software.name, super_admin_software_path(software))
            end
          end
        end
      end
      column do
        panel link_to('Availabilities', super_admin_availabilities_path) do
          ul do
            Availability.all.map do |availability|
              li link_to(availability.as_sentence, super_admin_availability_path(availability))
            end
          end
        end
        panel link_to('Conditions', super_admin_conditions_path) do
          ul do
            Condition.all.map do |condition|
              li link_to(condition.name, super_admin_condition_path(condition))
            end
          end
        end
      end
    end
  end
end
