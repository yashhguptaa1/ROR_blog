class Article < ApplicationRecord

    # adding constraints to columns
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end

# just defining class is enough to behave like a model