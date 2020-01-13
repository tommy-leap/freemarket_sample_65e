crumb :root do
  link "Fmarket", root_path
end

crumb :mypage do
  link "マイページ", users_edit_path
end

crumb :profile do
  link "プロフィール", users_profile_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", users_logout_path
  parent :mypage
end

crumb :detail do
  link "商品詳細", products_detail_path
end

crumb :add do
  link "支払い方法", add_card_path
  parent :mypage
end

crumb :edit do
  link "支払い方法", edit_card_path
  parent :mypage
end

crumb :identification do
  link "本人情報", users_identification_path
  parent :mypage
end


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).