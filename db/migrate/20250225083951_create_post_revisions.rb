class CreatePostRevisions < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `post_revisions` (
    #   `id` varchar(24) NOT NULL,
    #   `post_id` varchar(24) NOT NULL,
    #   `lexical` longtext,
    #   `created_at_ts` bigint NOT NULL,
    #   `created_at` datetime NOT NULL,
    #   `author_id` varchar(24) DEFAULT NULL,
    #   `title` varchar(2000) DEFAULT NULL,
    #   `post_status` varchar(50) DEFAULT NULL,
    #   `reason` varchar(50) DEFAULT NULL,
    #   `feature_image` varchar(2000) DEFAULT NULL,
    #   `feature_image_alt` varchar(191) DEFAULT NULL,
    #   `feature_image_caption` text,
    #   `custom_excerpt` varchar(2000) DEFAULT NULL,
    #   PRIMARY KEY (`id`),
    #   KEY `post_revisions_post_id_index` (`post_id`),
    #   KEY `post_revs_author_id_foreign` (`author_id`),
    #   CONSTRAINT `post_revs_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :post_revisions, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :post_id, limit: 24, null: false
      t.text :lexical
      t.bigint :created_at_ts, null: false
      t.string :author_id, limit: 24
      t.string :title, limit: 2000
      t.string :post_status, limit: 50
      t.string :reason, limit: 50
      t.string :feature_image, limit: 2000
      t.string :feature_image_alt, limit: 191
      t.text :feature_image_caption
      t.string :custom_excerpt, limit: 2000
      t.timestamps
    end

    add_index :post_revisions, :post_id
    add_index :post_revisions, :author_id
  end
end
