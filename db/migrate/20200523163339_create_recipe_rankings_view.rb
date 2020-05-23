class CreateRecipeRankingsView < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE VIEW recipe_rankings AS (
       SELECT row_number() OVER () AS id,
        total_votes.*, 
        rank() OVER (ORDER BY total_votes.score DESC) AS rank
        FROM (
        SELECT recipe_id, sum(value) AS score FROM votes GROUP BY recipe_id        
          ) AS total_votes      
      )
    SQL
  end

  def down
    execute("DROP VIEW recipe_rankings")
  end
end
