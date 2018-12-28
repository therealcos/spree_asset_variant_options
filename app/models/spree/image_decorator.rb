Spree::Image.class_eval do
  attr_accessor :viewable_ids

  has_many :variant_images, class_name: '::Spree::VariantImage', dependent: :destroy
  has_many :variants, through: :variant_images

  validates :variants_not_blank

  def variants_not_blank
  	if viewable_type == "Spree::Variant" && variants.length > 0
  		errors.add(:variants, "Variants can't be blank")
  	end
  end

  def variant_html_classes
    variant_ids.map { |variant| "tmb-#{variant}"}.join(" ")
  end
end
