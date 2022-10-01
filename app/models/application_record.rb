class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

# Every model that we create inherits from this class