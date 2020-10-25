module ApplicationHelper
    def full_title(page_title = '') # full_titleメソッドを定義
        base_title = 'サウナで”ととのう”'
        if page_title.blank?
          base_title # トップページはタイトル
        else
          "#{page_title} - #{base_title}" # トップ以外のページはタイトル「利用規約
        end
    end
end
