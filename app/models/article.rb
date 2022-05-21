class Article < ActiveRecord::Base
    belongs_to :author, class_name: "Admin"
    has_one_attached :attachment
    has_and_belongs_to_many :tags
end
