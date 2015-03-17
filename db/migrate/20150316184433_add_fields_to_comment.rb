class AddFieldsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :comment_content_html, :text
  end
end
