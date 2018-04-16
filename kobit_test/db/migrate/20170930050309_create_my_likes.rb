class CreateMyLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :my_likes do |t|
      t.string :name
      t.string :fruit

      t.timestamps
    end
  end
end
