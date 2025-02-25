class CreateNewsletters < ActiveRecord::Migration[8.0]
  def change
    # CREATE TABLE `newsletters` (
    #   `id` varchar(24) NOT NULL,
    #   `uuid` varchar(36) NOT NULL,
    #   `name` varchar(191) NOT NULL,
    #   `description` varchar(2000) DEFAULT NULL,
    #   `feedback_enabled` tinyint(1) NOT NULL DEFAULT '0',
    #   `slug` varchar(191) NOT NULL,
    #   `sender_name` varchar(191) DEFAULT NULL,
    #   `sender_email` varchar(191) DEFAULT NULL,
    #   `sender_reply_to` varchar(191) NOT NULL DEFAULT 'newsletter',
    #   `status` varchar(50) NOT NULL DEFAULT 'active',
    #   `visibility` varchar(50) NOT NULL DEFAULT 'members',
    #   `subscribe_on_signup` tinyint(1) NOT NULL DEFAULT '1',
    #   `sort_order` int unsigned NOT NULL DEFAULT '0',
    #   `header_image` varchar(2000) DEFAULT NULL,
    #   `show_header_icon` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_header_title` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_excerpt` tinyint(1) NOT NULL DEFAULT '0',
    #   `title_font_category` varchar(191) NOT NULL DEFAULT 'sans_serif',
    #   `title_alignment` varchar(191) NOT NULL DEFAULT 'center',
    #   `show_feature_image` tinyint(1) NOT NULL DEFAULT '1',
    #   `body_font_category` varchar(191) NOT NULL DEFAULT 'sans_serif',
    #   `footer_content` text,
    #   `show_badge` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_header_name` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_post_title_section` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_comment_cta` tinyint(1) NOT NULL DEFAULT '1',
    #   `show_subscription_details` tinyint(1) NOT NULL DEFAULT '0',
    #   `show_latest_posts` tinyint(1) NOT NULL DEFAULT '0',
    #   `background_color` varchar(50) NOT NULL DEFAULT 'light',
    #   `border_color` varchar(50) DEFAULT NULL,
    #   `title_color` varchar(50) DEFAULT NULL,
    #   `created_at` datetime NOT NULL,
    #   `updated_at` datetime DEFAULT NULL,
    #   PRIMARY KEY (`id`),
    #   UNIQUE KEY `newsletters_uuid_unique` (`uuid`),
    #   UNIQUE KEY `newsletters_name_unique` (`name`),
    #   UNIQUE KEY `newsletters_slug_unique` (`slug`)
    # ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    create_table :newsletters, id: false do |t|
      t.string :id, limit: 24, primary_key: true
      t.string :uuid, null: false, limit: 36
      t.string :name, null: false, limit: 191
      t.string :description, limit: 2000
      t.boolean :feedback_enabled, null: false, default: false
      t.string :slug, null: false, limit: 191
      t.string :sender_name, limit: 191
      t.string :sender_email, limit: 191
      t.string :sender_reply_to, null: false, default: 'newsletter', limit: 191
      t.string :status, null: false, default: 'active', limit: 50
      t.string :visibility, null: false, default: 'members', limit: 50
      t.boolean :subscribe_on_signup, null: false, default: true
      t.integer :sort_order, null: false, default: 0
      t.string :header_image, limit: 2000
      t.boolean :show_header_icon, null: false, default: true
      t.boolean :show_header_title, null: false, default: true
      t.boolean :show_excerpt, null: false, default: false
      t.string :title_font_category, null: false, default: 'sans_serif', limit: 191
      t.string :title_alignment, null: false, default: 'center', limit: 191
      t.boolean :show_feature_image, null: false, default: true
      t.string :body_font_category, null: false, default: 'sans_serif', limit: 191
      t.text :footer_content
      t.boolean :show_badge, null: false, default: true
      t.boolean :show_header_name, null: false, default: true
      t.boolean :show_post_title_section, null: false, default: true
      t.boolean :show_comment_cta, null: false, default: true
      t.boolean :show_subscription_details, null: false, default: false
      t.boolean :show_latest_posts, null: false, default: false
      t.string :background_color, null: false, default: 'light', limit: 50
      t.string :border_color, limit: 50
      t.string :title_color, limit: 50
      t.timestamps
    end

    add_index :newsletters, :uuid, unique: true
    add_index :newsletters, :name, unique: true
    add_index :newsletters, :slug, unique: true

    add_foreign_key :posts, :newsletters, column: :newsletter_id, primary_key: :id
  end
end
