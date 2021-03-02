require 'rails_helper'

RSpec.describe 'posts/show' do

  before do
    @item = Post.create(name: 'test', title: 'test title', content: 'test content')
    visit '/'
    find(:css, "#item-#{@item.name}").click
  end

  describe 'check edit' do

    before do
      find(:css, '#edit-link').click
    end

    it 'check redirect to form' do
      expect(page).to have_content 'Редактирование записи'
    end

    it 'check edit item' do
      old_title = @item.title
      fill_in 'post_title', with: 'change title'
      click_on 'Создать пост'
      expect(old_title).to equal(@item.title)
    end

  end

  describe 'check add children' do

    before do
      find(:css, '#add-child-link').click
    end

    it 'check redirect to form' do
      expect(page).to have_content 'Новая запись'
    end

    it 'check add child' do
      fill_in 'post_name', with: 'child_test'
      fill_in 'post_title', with: 'child title'
      fill_in 'post_content', with: "child content with **bold text**, and \\italic\\, and ((#{root_url}/#{@item.name} link))"
      click_on 'Создать пост'
      expect(page).to have_content('child title')
    end

  end

  describe 'check delete' do

    before do
      find(:css, '#delete-link').click
    end

    it 'check redirect to form' do
      expect(page).to have_content 'Приложение apress. Дерево постов'
    end

  end

end