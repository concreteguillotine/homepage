class Article < ActiveRecord::Base
    belongs_to :author, class_name: "Admin"
    has_one_attached :attachment
end
