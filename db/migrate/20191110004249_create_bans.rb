class CreateBans < ActiveRecord::Migration[6.0]
  def change
    create_table :bans do |t|
      t.string :ip
      t.datetime :time
    end
  end
end
