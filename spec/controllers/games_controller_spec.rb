require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "is_obstructed?" do
    it "should return true because it is obstructed" do
      

      # game = FactoryBot.create(:game)
      # game = FactoryBot.build(:game, white_player_id: 1, black_player_id: 2)
      
      game = Game.new
      piece1 = Piece.create(position_x: 7, position_y: 7, game_id: game.id)
      piece2 = Piece.create(position_x: 7, position_y: 5, game_id: game.id)
      game.pieces << piece1 << piece2 

      variable = piece1.is_obstructed?(game,[7,3])
      expect(variable).to eq(true)

    end
  end

    describe "is_obstructed?" do
    it "should return false because it is not obstructed" do
      
      game = Game.new
      piece1 = Piece.create(position_x: 7, position_y: 7, game_id: game.id)
      piece2 = Piece.create(position_x: 2, position_y: 2, game_id: game.id)
      game.pieces << piece1 << piece2

      variable = piece1.is_obstructed?(game,[3,3])
      expect(variable).to eq(false)
    end
  end

  describe "is_obstructed?" do
    it "should return false because it is not obstructed, even if destination square is occupied" do
      
      game = Game.new
      piece1 = Piece.create(position_x: 7, position_y: 7, game_id: game.id)
      piece2 = Piece.create(position_x: 2, position_y: 2, game_id: game.id)
      game.pieces << piece1 << piece2

      variable = piece1.is_obstructed?(game,[2,2])
      expect(variable).to eq(false)
    end
  end

  describe "is_obstructed?" do
    it "should return Invalid statement because it is not a linear move" do
      
      game = Game.new
      piece1 = Piece.create(position_x: 2, position_y: 2, game_id: game.id)
      piece2 = Piece.create(position_x: 6, position_y: 6, game_id: game.id)
      game.pieces << piece1 << piece2

      variable = piece1.is_obstructed?(game,[1,7])
      expect(variable).to eq("Invalid input.  Not diagnal, horizontal, or vertical.")
    end
  end





end
