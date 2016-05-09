class GameService
  attr_accessor :match
  ROLES = ["SHOOT", "SAVE"]
  CORNER = [4,2]
  List = Struct.new(:id, :start_role, :current_role, :score, :winner)

  def initialize(match = nil, list = ListSessionService)
    self.match = match.present? ? match : build_new_match(list)
  end

  def shoot(coords, list = ListSessionService)
    return "Game is over, Winner: #{match.winner}" if match.score.size >= 9
    return "Wrong action" if match.current_role != "SHOOT"

    trigger_action(coords, list)
  end

  def save(coords, list = ListSessionService)
    return "Game is over, Winner: #{match.winner}" if match.score.size >= 9
    return "Wrong action" if match.current_role != "SAVE"

    trigger_action(coords, list)
  end

  private

  def random_role
    ROLES[Random.rand(2)]
  end

  def build_new_match(session)
    id = session.last_id || 0
    role = random_role
    List.new(id, role, role, [], nil)
  end

  def computer_response
    [Random.rand(CORNER[0]), Random.rand(CORNER[1])]
  end

  def switch_role
    match.current_role = case match.current_role
    when "SHOOT"
      "SAVE"
    when "SAVE"
      "SHOOT"
    end
  end

  def save_winner
    user_points = 0
    computer_points = 0

    if match.start_role == "SHOOT"
      type = "odd"
    else
      type = "even"
    end

    match.score.each_with_index do |scored, num|
      if num.public_send("#{type}?") && scored
        user_points += 1
      elsif scored
        computer_points += 1
      end
    end

    match.winner = if user_points > computer_points
      "User"
    elsif user_points < computer_points
      "Computer"
    else
      "Draw"
    end
  end

  def trigger_action(coords, list)
    match.score << (coords == computer_response)
    save_winner if match.score.size == 9
    switch_role
    list.update(match)
  end
end
