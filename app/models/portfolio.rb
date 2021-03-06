class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
  validates_presence_of :title, :body, :main_image, :thumbnail
  after_initialize :set_defaults

  def self.angular
    where(subtitle: "Angular")
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumbnail ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
