class ChangeEventDateToDateTime < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :date, :datetime
  end
end