class User < ActiveRecord::Base
  has_secure_password
  has_many :matches

  attr_accessible :bio, :gender, :name, :password, :password_confirmation, :user_image, :username, :role

  mount_uploader :user_image, UserImageUploader

  def join_challenge
    match = Match.where(player2_id: self.id)
      if match.order.last == nil
        nil
      else
        unless match.order.last.game_finished?
              match.order.last
    #   match.each do |match|
    #   unless match.game_finished?
    #   match.last
      end
    end
  end

  def user_matches_versus
    m = Match.where("player1_id=? or player2_id=?", self.id, self.id)
    m.each do |match|
      match.player2_id
    end
  end

  def matches_won
    m = Match.where(winner: self.id)
    m.size
  end

  def matches_lost
    m = Match.where(loser: self.id)
    m.size
  end

def games_not_completed
    m = Match.where("(player1_id=? or player2_id=?) and (loser is NULL and winner is NULL)", self.id, self.id)
    x = []
    m.each do |match|
      x << match unless match.game_finished?
      x.size
    end
end

end
