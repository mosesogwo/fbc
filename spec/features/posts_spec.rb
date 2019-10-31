# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post Management' do
  scenario 'create new post' do
    register_user('uac3@gmail.com')
    fill_in 'Create a post', with: 'My new post'
    click_button 'Post'
    expect(page).to have_content('Post successfully created')
  end

  scenario 'edit post' do
    visit posts_path
    sign_in_user('uac3@gmail.com')
    fill_in 'Create a post', with: 'a new post'
    click_on 'Edit'
    fill_in 'Edit post', with: 'an updated post'
    click_on 'Post'
    expect(page).to have_content('Post successfully edited')
  end

  scenario 'delete post' do
    visit posts_path
    sign_in_user('uac3@gmail.com')
    fill_in 'Create a post', with: 'a new post'
    click_on 'Delete'
    expect(page).to have_content('Post deleted')
  end
end
