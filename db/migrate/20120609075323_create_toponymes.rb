class CreateToponymes < ActiveRecord::Migration
  def change
    create_table :toponymes do |t|
      t.string :toponyme_actuel
      t.string :variante_graphique
      t.string :prononciation_locale
      t.string :emploi_contexte
      t.text :ethymologie_proposee
      t.references :enqueteur

      t.timestamps
    end
    add_index :toponymes, :enqueteur_id
  end
end
