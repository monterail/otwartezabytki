# encoding: utf-8
class AlertsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  before_filter :enable_fancybox, :unless => lambda {|c| Subdomain.matches?(c.request) }

  expose(:relic) { Relic.find(params[:relic_id]) }
  expose(:alerts) { relic.alerts }
  expose(:alert)

  def new
    if params[:description].match(/zabytek nie istnieje/)
      relic.update_attribute(:existence, "archived")
      flash.now[:notice] = "Zabytek został zarchiwizowany."
    end

    render Subdomain.matches?(request) ? 'alerts/iframe/new' : 'new'
  end

  def create
    authorize! :create, Alert

    alert.user_id = current_user.try(:id)
    if Subdomain.matches?(request)
      if alert.save
        render 'alerts/iframe/created'
      else
        render 'alerts/iframe/new'
      end
    else
      if alert.save
        redirect_to relic, :notice => t('notices.alert_added')
      else
        render 'new'
      end
    end
  end
end
