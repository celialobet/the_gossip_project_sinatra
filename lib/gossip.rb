require 'csv'

class Gossip

  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv","ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1]) 
    end
    return all_gossips
  end

  def self.find(id)
    gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if (id == index + 1)
        gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return gossips
    end
  end

  def self.update(id,author,content)
    gossips = []
		CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
			if (id == index + 1) 
				gossips << [csv_line[0], csv_line[1]]
			end
      return gossips
		end

		CSV.open("./db/gossip.csv", "w") do |csv| 
			gossips.each do |gossip|
				csv << [gossip.author, gossip.content]
      end
    end
  end


end