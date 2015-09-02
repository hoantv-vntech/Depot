class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price,  numericality: {greater_than_or_equal_to: 0.01}
  #validates :title, uniqueness: true
  validates_uniqueness_of :title, message: "must be unique, not the same"
  #validates :title, length: { minimum: 10}
  validates_length_of :title, minimum: 10, message: "Must be at least 10 characters"
  validates :image_url, allow_blank: true, 
    format: { with: %r{([^\s]+(\.(?i)(jpg|png|gif|bmp))$)}i, 
    message: 'must be a URL for GIF, JPG or PNG image.'}  
end
