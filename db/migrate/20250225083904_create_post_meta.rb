class CreatePostMeta < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `posts_meta` (
    #   `id` varchar(24) NOT NULL,
    #   `post_id` varchar(24) NOT NULL,
    #   `og_image` varchar(2000) DEFAULT NULL,
    #   `og_title` varchar(300) DEFAULT NULL,
    #   `og_description` varchar(500) DEFAULT NULL,
    #   `twitter_image` varchar(2000) DEFAULT NULL,
    #   `twitter_title` varchar(300) DEFAULT NULL,
    #   `twitter_description` varchar(500) DEFAULT NULL,
    #   `meta_title` varchar(2000) DEFAULT NULL,
    #   `meta_description` varchar(2000) DEFAULT NULL,
    #   `email_subject` varchar(300) DEFAULT NULL,
    #   `frontmatter` text,
    #   `feature_image_alt` varchar(191) DEFAULT NULL,
    #   `feature_image_caption` text,
    #   `email_only` tinyint(1) NOT NULL DEFAULT '0',
    #   PRIMARY KEY (`id`),
    #   UNIQUE KEY `posts_meta_post_id_unique` (`post_id`),
    #   CONSTRAINT `posts_meta_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :post_meta, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :post_id, limit: 24, null: false
      t.string :og_image, limit: 2000
      t.string :og_title, limit: 300
      t.string :og_description, limit: 500
      t.string :twitter_image, limit: 2000
      t.string :twitter_title, limit: 300
      t.string :twitter_description, limit: 500
      t.string :meta_title, limit: 2000
      t.string :meta_description, limit: 2000
      t.string :email_subject, limit: 300
      t.text :frontmatter
      t.string :feature_image_alt, limit: 191
      t.text :feature_image_caption
      t.boolean :email_only, null: false, default: false
    end

    add_index :post_meta, :post_id, unique: true
    add_foreign_key :post_meta, :posts, column: :post_id, primary_key: :id
  end
end
