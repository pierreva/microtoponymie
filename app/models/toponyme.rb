class Toponyme < ActiveRecord::Base
  belongs_to :enqueteur
  attr_accessible :emploi_contexte, :ethymologie_proposee, :prononciation_locale, :toponyme_actuel, :variante_graphique
end
