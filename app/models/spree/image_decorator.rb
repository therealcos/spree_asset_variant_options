Spree::Image.class_eval do
  attr_accessor :viewable_ids

  has_many :variant_images, class_name: '::Spree::VariantImage', dependent: :destroy
  has_many :variants, through: :variant_images

  validates :variants, :length => { :minimum => 1, :message => "can't be blank" }, :if => :viewable_is_variant?

  def viewable_is_variant?
  	viewable_type == "Spree::Variant"
  end

  def variant_html_classes
    variant_ids.map { |variant| "tmb-#{variant}"}.join(" ")
  end
end
