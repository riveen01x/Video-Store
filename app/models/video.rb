class Video < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user
  has_and_belongs_to_many :genres
  has_rich_text :description 
  has_one_attached :thumbnail
  has_many :copies, dependent: :destroy
  has_many :rent_items
  belongs_to :customer, optional: true
  belongs_to :category, optional: true
  
  validates :rent_price, numericality: { only_decimal: true }, presence: true, allow_blank: false

  has_many :actors_videos
  has_many :actors, through: :actors_videos
  has_many :line_items
  has_many :order_items
  before_save :set_dvd
  before_save :set_vhs
  before_save :set_bluray
  before_save :set_stock
  #before_save :set_date

  
  accepts_nested_attributes_for :genres, reject_if: :all_blank


    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 

  private


  def not_referenced_by_any_line_item
     unless line_items.empty?
       errors.add(:base, "Line items present")
       throw :abort
     end
  end

  def set_date
    self[:rented_at] = self[:created_at]
  end

  def set_dvd
   if self[:dvd_copies] == nil
    self[:dvd_copies] = 0
   end
  end

  def set_vhs
   if self[:vhs_copies] == nil
    self[:vhs_copies] = 0
   end
  end

  def set_bluray
   if self[:bluray_copies] == nil
    self[:bluray_copies] = 0
   end
  end

  def set_stock
   if self[:stock] == nil
    self[:stock] = 0
   end
  end

end
