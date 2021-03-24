class Battery < ApplicationRecord
    belongs_to :building
    has_many :columns
    has_one :intervention

end
