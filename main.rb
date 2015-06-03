require_relative 'itinerary'

#Driver Code

#Create Objects
site1 = Site.new("aachen Cathedral", "germany", "Europe and North America", "cultural", "It is Emperor Charlemagne´s own Palatine Chapel, which constitutes the nucleus of the Cathedral of Aachen, located in western Germany", 6)
site1.thumbs_up
site1.summarise
puts site1

site2 = Site.new("wadden sea", "germany", "Europe and North America", "natural", 3)
site2.thumbs_down
puts site2

site3 = Site.new("masada", "israel", "Europe and North America", "natural", "Masada is a dramatically located site of great natural beauty overlooking the Dead Sea, a rugged natural fortress on which the Judaean king Herod the Great constructed a sumptuous palace complex in classical Roman style", 6)
puts site3

#Add objects to Itinerary
it1 = Itinerary.new("European Adventure")
it1.add_site(site1)
it1.add_site(site2)
it1.add_site(site3)

