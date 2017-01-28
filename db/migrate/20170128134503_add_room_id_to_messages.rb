class AddRoomIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room_id, :integer, index: true
    add_column :messages, :bot_flg, :boolean, default: false, null: false
    add_column :messages, :intent, :string, default: 'text', null: false
  end
end
