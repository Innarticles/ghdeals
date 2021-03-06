class Promo < ActiveRecord::Base

	CATEGORIES = ['Electronics', 'Clothing', 'Food', 'Fitness','Hospitality']

	has_attached_file :image,
                    # :path =>  ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
                    :path => ":rails_root/public/images/:id/:style/:filename",
                    :url  => "/images/:id/:style/:filename",
                    :styles   => {
                    	:thumb    => ['200x200#',  :jpg, :quality => 70],
                    	:preview  => ['300x300#',  :jpg, :quality => 70],
                    	:large    => ['600>',      :jpg, :quality => 70],
                    	:retina   => ['1200>',     :jpg, :quality => 30]
                    }

                    validates :image, :attachment_presence => true
                    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
                    validates :description, :length => {minimum: 100}
                    validates_presence_of :discount, :category, :contact, :shop
     belongs_to :user
end
