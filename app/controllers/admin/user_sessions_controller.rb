class Admin::UserSessionsController < Devise::SessionsController
   # ↓ログインページ用のレイアウトを用意するので宣言
  layout 'admin/layouts/admin_login'

end
