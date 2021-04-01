class Intervention < ApplicationRecord
    belongs_to :customer
    belongs_to :building
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
    belongs_to :employee, optional: true
    validates_presence_of :author
    validates_presence_of :customer_id
    validates_presence_of :building_id
    
end
