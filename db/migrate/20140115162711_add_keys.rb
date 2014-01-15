class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "reviews", "restaurants", name: "reviews_restaurant_id_fk"
    add_foreign_key "reviews", "users", name: "reviews_user_id_fk"
  end
end
