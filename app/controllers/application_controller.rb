class ApplicationController < ActionController::API
  before_action :fake_load

  def fake_load
    sleep(1)
  end

  #HerokuでReact Routerを使用するための設定
  #include ActionController::MimeResponds
  #  def fallback_index_html
  #      respond_to do |format|
  #          format.html { render body: Rails.root.join('public/index.html').read }
  #      end
  #  end

# NN生命テスト
=begin
  include ActionController::MimeResponds
  def fallback_index_html
       respond_to do |format|
           format.html { render body: Rails.root.join('public/index.html').read }
       end
  end
end
=end
