module ApplicationHelper
  def paragraph_prefix text, n=50
    text[0...n].split("\n",2).first
  end
end
