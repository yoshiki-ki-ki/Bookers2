class RemoveIntroductionFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :introduction, :string
  end
end
