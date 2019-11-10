class CreateBans < ActiveRecord::Migration[6.0]
  def change
    create_table :bans do |t|

      t.timestamps
    end
  end
end
