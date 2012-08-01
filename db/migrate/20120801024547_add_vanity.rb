class AddVanity < ActiveRecord::Migration
  def change
    add_column  :urls, :vanity, :string
  end
end
