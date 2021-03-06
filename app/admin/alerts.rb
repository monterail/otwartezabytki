# -*- encoding : utf-8 -*-

ActiveAdmin.register Alert do
  menu :label => "Zarządzanie", :parent => "Alerty", :priority => 1
  actions :all, except: [:show]

  index do
    column :id

    column :relic do |e|
      link_to e.relic.identification, admin_relic_path(e.relic_id)
    end

    column "Zgłaszający" do |e|
      if e.user
        mail_to e.user.try(:email)
      else
        "nieznany"
      end
    end

    column "Opis" do |e|
      e.description
    end

    column "Plik" do |e|
      if e.file?
        link_to image_tag(e.file.mini.url), e.file.url, :target => '_blank'
      else
        'brak'
      end
    end

    column :state do |e|
      t("alert_states.#{e.state}")
    end

    default_actions
  end

  form do |f|
    f.inputs do
      f.input :state, :collection => I18n.t('alert_states').invert, :include_blank => false
      f.input :description
      f.input :author
      f.input :date_taken
      f.buttons
    end

  end

  filter :id
  filter :relic_id, :as => :numeric
  filter :description
  filter :state
end
