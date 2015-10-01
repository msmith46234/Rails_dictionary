class Definition < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :meaning, presence: true
  has_many :examples
  accepts_nested_attributes_for :examples
paginates_per 10
  def self.search(search)
    where("word OR meaning LIKE ?" , "%#{search}%")
  end

end
