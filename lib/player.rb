class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name.to_s
    @life_points = 10
  end

  def show_state
     "#@name à #@life_points points de vie. "
  end

  def gets_damage(life_points)
    @life_points = @life_points - life_points
    if @life_points > 0
      puts "#@name a #@life_points points."
    else puts "Le joueur #@name a été tué!"
    end
  end

  def attack(player)
    damage = compute_damage
    puts "#@name attaque #{player.name}"
    player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts  "#@name a #@life_points points de vie et une arme de niveau #@weapon_level. "
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else  "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    
    if health_pack == 1 
      puts "Tu n'as rien trouvé."
    elsif health_pack >= 2 && health_pack <= 5 
      @life_points = (@life_points + 50).clamp(0, 100)
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else @life_points = (@life_points + 80).clamp(0, 100)
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      
    end
  end  

end

