# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :hello
  layout :layout_for_page
  append_view_path Page::Resolver.new

  def show
    render params[:id]
  end

  protected
    def layout_for_page
      case params[:id]
        when 'share_close' then nil
        else 'application'
      end
    end
end
