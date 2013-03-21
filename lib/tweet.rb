class Tweet
  include ActiveModel::Validations

  validates :text, :length => { :minimum => 1, :maximum => 140 }, :presence => true

  attr_reader :text
 
  def initialize(text)
    @text = text
  end

  def translate_to(language)
    translation = Translation.new(@text,language)
    @text = translation.result_message
    self
  end

end
