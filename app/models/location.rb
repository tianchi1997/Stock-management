class Location < ApplicationRecord
    belongs_to :group
    has_many :sublocations
end
