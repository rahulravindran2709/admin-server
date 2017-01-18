class Coach < ApplicationRecord
  belongs_to :user
  belongs_to :fellow
  has_one :national_finance_head, through: :fellow
  has_many :volunteers

  validates_presence_of :user, :fellow
end
