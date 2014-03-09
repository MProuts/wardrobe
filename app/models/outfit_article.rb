class OutfitArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :outfit
end
