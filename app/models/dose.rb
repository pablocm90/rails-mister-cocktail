class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, presence: true, uniqueness: {scope: :ingredient_id }
  validates :ingredient, presence: true
  validates :description, presence: true
end
