class AddColumnExtToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :ext, :string
  end
end
