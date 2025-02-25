class CreatePostProducts < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `posts_products` (
    #   `id` varchar(24) NOT NULL,
    #   `post_id` varchar(24) NOT NULL,
    #   `product_id` varchar(24) NOT NULL,
    #   `sort_order` int unsigned NOT NULL DEFAULT '0',
    #   PRIMARY KEY (`id`),
    #   KEY `posts_products_post_id_foreign` (`post_id`),
    #   KEY `posts_products_product_id_foreign` (`product_id`),
    #   CONSTRAINT `posts_products_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
    #   CONSTRAINT `posts_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :post_products, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :post_id, limit: 24, null: false
      t.string :product_id, limit: 24, null: false
      t.integer :sort_order, null: false, default: 0
      t.timestamps
    end

    add_index :post_products, :post_id
    add_index :post_products, :product_id
    add_foreign_key :post_products, :posts, column: :post_id, primary_key: :id, on_delete: :cascade
  end
end
