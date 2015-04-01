class ComplexTeam
  def seos
    User.find(3,5)
  end

  def developers
    User.find(1,2,4,6,7,9)
  end
end
