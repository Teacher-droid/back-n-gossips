class JoinUserToTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :gossips, :user, foreign_key: true

  end
end
