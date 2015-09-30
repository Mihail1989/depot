class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
                with: %r{\.(gif|jpg|png)\Z}i,
                message: 'URL must be for GIF, JPG, PNG image.'
            #URL должен указывать на изображение формата GIF, JPG, PNG.
                      }
  validates_length_of :title, minimum: 10, message: 'Title must be greater than 10'

  def self.latest
    Product.order(:updated_at).last
  end
end
