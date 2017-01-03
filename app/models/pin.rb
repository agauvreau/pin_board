class Pin < ApplicationRecord
    #each pin can only have one user
    belongs_to :user
end
