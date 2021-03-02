require 'uri'

module ApplicationHelper

  def calc_correct_url(url)
    #Парсим юрл если там есть русские символы
    URI.escape(url)
  end

  def format_text(text)
    # Форматируем текст на странице просмора, можно использовать декоратор, но в этой реализации использую хелпер
    # не хочется создавать дополнительный файл и устанавливать гем
    ftext = text.gsub(/\*\*([A-Za-zА-Яа-я0-9ё\s,]+)\*\*/) {"<b>#{$1}</b>"}
    ftext = ftext.gsub(/\\\\([A-Za-zА-Яа-я0-9ё\s,]+)\\\\/) {"<i>#{$1}</i>"}
    ftext = ftext.gsub(/\(.*?\)\)/) do |m| # Такая грязная реализация из-за того что не могу подобрать нормальное выражение
      url = URI.extract(m)[0]
      text = m.gsub("((#{URI.extract(m)[0]} ", '').gsub("))", '')
      "<a href='#{url}'>#{text}</a>"
    end
    ftext.html_safe
  end

end
