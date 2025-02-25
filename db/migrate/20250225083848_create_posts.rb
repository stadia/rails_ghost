class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `posts` (
    #   `id` varchar(24) NOT NULL,
    #   `uuid` varchar(36) NOT NULL,
    #   `title` varchar(2000) NOT NULL,
    #   `slug` varchar(191) NOT NULL,
    #   `mobiledoc` longtext,
    #   `lexical` longtext,
    #   `html` longtext,
    #   `comment_id` varchar(50) DEFAULT NULL,
    #   `plaintext` longtext,
    #   `feature_image` varchar(2000) DEFAULT NULL,
    #   `featured` tinyint(1) NOT NULL DEFAULT '0',
    #   `type` varchar(50) NOT NULL DEFAULT 'post',
    #   `status` varchar(50) NOT NULL DEFAULT 'draft',
    #   `locale` varchar(6) DEFAULT NULL,
    #   `visibility` varchar(50) NOT NULL DEFAULT 'public',
    #   `email_recipient_filter` text NOT NULL,
    #   `created_at` datetime NOT NULL,
    #   `created_by` varchar(24) NOT NULL,
    #   `updated_at` datetime DEFAULT NULL,
    #   `updated_by` varchar(24) DEFAULT NULL,
    #   `published_at` datetime DEFAULT NULL,
    #   `published_by` varchar(24) DEFAULT NULL,
    #   `custom_excerpt` varchar(2000) DEFAULT NULL,
    #   `codeinjection_head` text,
    #   `codeinjection_foot` text,
    #   `custom_template` varchar(100) DEFAULT NULL,
    #   `canonical_url` text,
    #   `newsletter_id` varchar(24) DEFAULT NULL,
    #   `show_title_and_feature_image` tinyint(1) NOT NULL DEFAULT '1',
    #   PRIMARY KEY (`id`),
    #   UNIQUE KEY `posts_slug_type_unique` (`slug`,`type`),
    #   KEY `posts_updated_at_index` (`updated_at`),
    #   KEY `posts_published_at_index` (`published_at`),
    #   KEY `posts_newsletter_id_foreign` (`newsletter_id`),
    #   KEY `posts_type_status_updated_at_index` (`type`,`status`,`updated_at`),
    #   CONSTRAINT `posts_newsletter_id_foreign` FOREIGN KEY (`newsletter_id`) REFERENCES `newsletters` (`id`)
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :posts, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :uuid, null: false, limit: 36
      t.string :title, null: false, limit: 2000
      t.string :slug, null: false, limit: 191
      t.text :mobiledoc
      t.text :lexical
      t.text :html
      t.string :comment_id, limit: 50
      t.text :plaintext
      t.string :feature_image, limit: 2000
      t.boolean :featured, null: false, default: false
      t.string :type, null: false, default: 'post', limit: 50
      t.string :status, null: false, default: 'draft', limit: 50
      t.string :locale, limit: 6
      t.string :visibility, null: false, default: 'public', limit: 50
      t.text :email_recipient_filter, null: false
      t.string :created_by, null: false, limit: 24
      t.string :updated_by, limit: 24
      t.datetime :published_at
      t.string :published_by, limit: 24
      t.string :custom_excerpt, limit: 2000
      t.text :codeinjection_head
      t.text :codeinjection_foot
      t.string :custom_template, limit: 100
      t.text :canonical_url
      t.string :newsletter_id, limit: 24
      t.boolean :show_title_and_feature_image, null: false, default: true
      t.timestamps
    end

    add_index :posts, [ :slug, :type ], unique: true
    add_index :posts, :updated_at
    add_index :posts, :published_at
    add_index :posts, :newsletter_id
    add_index :posts, [ :type, :status, :updated_at ]
  end
end
