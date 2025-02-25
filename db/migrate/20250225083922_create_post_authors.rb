class CreatePostAuthors < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `posts_authors` (
    #   `id` varchar(24) NOT NULL,
    #   `post_id` varchar(24) NOT NULL,
    #   `author_id` varchar(24) NOT NULL,
    #   `sort_order` int unsigned NOT NULL DEFAULT '0',
    #   PRIMARY KEY (`id`),
    #   KEY `posts_authors_post_id_foreign` (`post_id`),
    #   KEY `posts_authors_author_id_foreign` (`author_id`),
    #   CONSTRAINT `posts_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
    #   CONSTRAINT `posts_authors_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :post_authors, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :post_id, limit: 24, null: false
      t.string :author_id, limit: 24, null: false
      t.integer :sort_order, null: false, default: 0
      t.timestamps
    end

    add_index :post_authors, :post_id
    add_index :post_authors, :author_id
    add_foreign_key :post_authors, :posts, column: :post_id, primary_key: :id
  end
end
