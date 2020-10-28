class Sauna < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ikitais, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :sauna_genres, dependent: :destroy
  has_many :genres, through: :sauna_genres
  attachment :image

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

  # 「イキタイ」ランキング
  def self.ikitai_ranking
    self.find(Ikitai.group(:sauna_id).order('count(sauna_id) DESC').limit(10).pluck(:sauna_id))
  end

  # 「PV数」ランキング
  def self.pv_ranking
    self.order(impressions_count: 'DESC').limit(10)
  end

  # 「イキタイ」が既に押してあるかの確認
  def iktaied_by?(user)
    ikitais.where(user_id: user.id).exists?
  end

 
end
