require 'rails_helper'

RSpec.describe 'posts/index' do

  before do
    visit '/'
  end

  describe 'check root page elements' do

    it 'check root page' do
      expect(page).to have_content 'Приложение apress. Дерево постов'
    end


    it 'check add_new_root button' do
      expect(page).to have_content 'Добавить новый корневой пост'
    end

    it 'check redirect from root page to form' do
      find(:css, '#new-form').click
      expect(page).to have_content 'Новая запись'
    end

    it 'check redirect from form to root page' do
      find(:css, '#new-form').click
      find(:css, '#root-page-link').click
      expect(page).to have_content 'Приложение apress. Дерево постов'
    end

  end

  describe 'check items and redirect show page' do

    before do
      @item = Post.first
    end

    it 'check items' do
      expect(page).to have_content @item.name
    end

    it 'check redirect from root page to show item page' do
      find(:css, "#item-#{@item.name}").click
      expect(page).to have_content @item.title
    end

  end

end