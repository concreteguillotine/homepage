class CreateJoinTableTagsArticles < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tags, :articles do |t|
      t.index [:tag_id, :article_id], unique: true
      t.index [:article_id, :tag_id]
    end
  end
end
