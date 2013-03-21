# coding: utf-8

class Message
  def initialize(content,source_language='auto')
    @content = content
    @language = source_language
  end

  # def translate_to(target_language)
  #   Translation.new(self, target_language)
  # end

end