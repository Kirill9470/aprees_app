require 'rails_helper'

RSpec.describe 'posts/_form' do

  before do
    visit '/'
    find(:css, '#new-form').click
  end

  describe 'check work validation' do

    before do
      fill_in 'post_name', with: ''
      fill_in 'post_title', with: ''
      fill_in 'post_content', with: ''
      click_on 'Создать пост'
    end

    it 'check name error' do
      expect(page).to have_content 'Имя не может быть пустым'
      expect(page).to have_content 'Имя имеет неверное значение'
    end

    it 'check title error' do
      expect(page).to have_content 'Заголовок не может быть пустым'
    end

    it 'check content error' do
      expect(page).to have_content 'Текст не может быть пустым'
    end

  end

end