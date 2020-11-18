class Sauna < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ikitais, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :sauna_genres, dependent: :destroy
  has_many :genres, through: :sauna_genres
  attachment :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: { maximum: 50 }
  validates :address_street, presence: true, length: { maximum: 50 }
  validates :address_building, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 400 }
  validates :business_hour, presence: true, length: { maximum: 100 }
  validates :water_temperature, presence: true
  validates :sauna_temperature, presence: true

  # PV数取得
  is_impressionable counter_cache: true

  # 住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code

  # 都道府県名
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  # 都道府県名
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # 住所
  def full_address
    '〒' + self.postcode.to_s + ' ' + prefecture_name + ' ' + self.address_city + ' ' + self.address_street
  end

  # 「イキタイ」ランキング
  def self.ikitai_ranking
    self.find(Ikitai.group(:sauna_id).order("count(sauna_id) DESC").limit(10).pluck(:sauna_id))
  end

  # 「PV数」ランキング
  def self.pv_ranking
    self.order(impressions_count: "DESC").limit(10)
  end

  # 「サウナ飯数」ランキング
  def self.food_ranking
    self.find(Food.group(:sauna_id).order("count(sauna_id) DESC").limit(10).pluck(:sauna_id))
  end

  # 緯度経度を取得
  geocoded_by :geocode_full_address
  after_validation :geocode

  # geocoder専用住所
  def geocode_full_address
    self.address_city + self.address_street
  end

  # 「イキタイ」が既に押してあるかの確認
  def iktaied_by?(user)
    ikitais.where(user_id: user.id).exists?
  end

  # キーワード検索
  def self.keyword_search(keyword_search)
    Sauna.where([
      "name LIKE ? OR introduction LIKE ? OR address_city LIKE ? OR address_street LIKE ?",
      "%#{keyword_search}%", "%#{keyword_search}%", "%#{keyword_search}%", "%#{keyword_search}%",
    ])
  end

  # 都道府県検索
  def self.prefecture_search(prefecture_search)
    Sauna.where(prefecture_code: prefecture_search)
  end

  # ジャンル検索
  def self.genre_search(genre_search_id)
    Sauna.joins(:sauna_genres).where("sauna_genres.genre_id = #{genre_search_id}")
  end

  # レビューの平均点
  def average_score
    @sum = 0
    reviews.each do |review|
      @sum += review.score
    end
    if @sum > 0
      @sum /= reviews.length
    end
    return @sum
  end
end
