# Посты
class Post < ApplicationRecord
  # Использую этот гем потому что с ним успешно можно строить деревовидные структуры
  # + есть протестированные методы
  has_ancestry orphan_strategy: :destroy

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9А-Яа-я_]+\z/}
  validates :title, :content, presence: true

  def create_ancestors_url
    # используем для генерации части юрл
    '/' + ancestors.map(&:name).join('/') if ancestors.present?
  end
end
