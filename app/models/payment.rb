class Payment <ApplicationRecord
    belongs :user
    has_many :category, dependent: :destroy

    validates :name, presence: true, length: { maximum: 30 }
    validates :amount, presence: true, numericality: { greater_than: 0, only_integer: true }
end