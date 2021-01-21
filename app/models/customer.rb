class Customer < ApplicationRecord
    validates :name, {presence: true}
    validates :telno, {presence: true}
end
