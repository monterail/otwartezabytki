# -*- encoding : utf-8 -*-
class AddGeocodedToRelics < ActiveRecord::Migration
  def change
    add_column :relics, :geocoded, :boolean
  end
end
