class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  audited
  acts_as_paranoid
end
