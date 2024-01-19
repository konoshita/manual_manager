crumb :admin_dashboard do
  link '<i class="fa fa-dashboard"></i> Home'.html_safe, admin_root_path
end

crumb :edit_admin_site do
  link '設定', edit_admin_site_path
  parent :admin_dashboard
end

crumb :admin_users do
  link 'ユーザー', admin_users_path
  parent :admin_dashboard
end

crumb :admin_user do |user|
  link 'プロフィール', admin_user_path(user)
  parent :admin_users
end

crumb :new_admin_user do
  link 'ユーザーの作成', new_admin_user_path
  parent :admin_users
end

crumb :admin_categories do
  link 'カテゴリー', admin_categories_path
  parent :admin_dashboard
end

crumb :edit_admin_category do |category|
  link 'カテゴリー編集', edit_admin_category_path(category)
  parent :admin_categories
end

crumb :admin_authors do
  link '著者', admin_authors_path
  parent :admin_dashboard
end

crumb :edit_admin_author do |author|
  link '著者編集', edit_admin_author_path(author)
  parent :admin_authors
end

crumb :admin_manuals do
  link 'マニュアル', admin_manuals_path
  parent :admin_dashboard
end

crumb :new_admin_manual do
  link 'マニュアル作成', new_admin_manual_path
  parent :admin_manuals
end

crumb :edit_admin_manual do |manual|
  link 'マニュアル編集', edit_admin_manual_path(manual.uuid)
  parent :admin_manuals
end

crumb :admin_tags do
  link 'タグ', admin_tags_path
  parent :admin_dashboard
end

crumb :edit_admin_tag do |tag|
  link 'タグ編集', edit_admin_tag_path(tag)
  parent :admin_tags
end