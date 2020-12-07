module ApplicationHelper
  def full_title(page_title = '') # full_titleメソッドを定義
      base_title = 'サウナで”ととのう”'
      if page_title.blank?
        base_title # トップページはタイトル
      else
        "#{page_title} - #{base_title}" 
      end
  end

  def unchecked_notifications(user)
    user.passive_notifications.where(checked: false)
  end

  def default_meta_tags
    {
      site: 'サイト名',
      title: 'サウナでととのう',
      description: 'サウナで"ととのう"はサウナの検索、レビューサイトです。全国の登録されたサウナ、レビューにいち早くアクセスできます。',
      keywords: 'サウナ、温泉、ととのう、検索、レビュー、現在地',
      icon: [
        { href: image_url('totonousauna.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'サウナでととのう',
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('totonousauna.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@aoshiunichan',
      }
    }
  end
end
