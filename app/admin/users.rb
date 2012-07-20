ActiveAdmin.register User do
  controller.authorize_resource

  filter :id
  filter :email
  filter :created_at

  index do
    column :id
    column :email
    column :role
    column :created_at
    default_actions
  end


  form do |f|

    f.inputs do
      f.input :email
      f.input :role, :collection => [:admin, :user], :include_blank => true
    end

    f.actions
  end


end
