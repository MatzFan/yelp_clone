class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "reviews", "users", name: "reviews_user_id_fk"
  end
end
