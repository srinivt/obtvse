class AddUserIdToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.belongs_to :user, :null => false, :default => User.first.id
    end
    Post.update_all(:user_id => User.first.id)
  end
  
  def down
    remove_column :posts, :user_id
  end
end
