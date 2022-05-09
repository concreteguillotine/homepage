class Article < ActiveRecord::Base
    has_one_attached :attachment
end
