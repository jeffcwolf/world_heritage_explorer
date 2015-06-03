README

[User Stories]

As a TRAVELER I want to be able to review and search for World Heritage SITES (culled from an XML file which contains a full listing of all WH sites).
  -->Should be able to search and sort sites based on various criteria

As a TRAVELER I want to be able to add interesting SITES to an ITINERARY (or multiple itineraries) - thereby building an itinerary.

As a TRAVELER I want to be able to print stats about my itinerary(s) - like the number of sites, the breakdown of types (cultural vs. natural), a list of countries, and regions, etc

As a TRAVELER I want to be able to generate random itineraries based on criteria I choose (e.g. give me a random list of 10 cultural sites in Germany)

As a TRAVELER I want to be able to print out selected itineraries (and save them to a file)

[Program Design]

The main classes of objects in this program are TRAVELERS, SITES, AND ITINERARIES. Each class should have a single responsibility.
  -->What are the state(s) and behaviours of each class?
  -->How do I determine if the 'add-itinerary' method should be part of the Itinerary or Traveler class? On the one hand, a Traveler is the one who wants to add an itinerary - it is a behaviour that it has. On the other, it is something related to Itineraries - not Travelers. Or is it that methods (behaviors) should be included in the Class whose objects will call those methods? That sounds right to me. So, what objects will call the method add-itinerary? What objects have that behavior? The Traveler object does - and adds an itinerary to his collection of itineraries. An Itinerary object does not call the add-itinerary method.

SITE [State & Behavior]
  A Site object has various attributes, including name, country, region, type, and description. Query: where to store a Traveler's level of interest in a particular site object? As part of the state of the site object itself (but then don't different travelers rate it differently?) or as part of a collection of sites - 'sites of interest' - that are associated with a Traveler?

  A site object has various behaviors or things it can do. It can summarise [summarise method] itself (provide its name, country, and description). It can also indicate which Itineraries it belongs to (itinerary_list method).

ITINERARY [State & Behavior]
  An Itinerary object has various attributes, including a name, description of the itinerary, and the collection of site objects it contains.

  An itinerary also has various behaviors (methods). It can add or remove a site object to/from its collection, and it can print summary stats about itself (i.e about its collection).

TRAVELER [State & Behavior]
  A Traveler object has various attributes, including a name, and the collection of Itinerary objects associated with it (i.e. that it contains).

  A traveler object also has various behaviors (methods). It can


The program should be developed using TDD (RSpec).

Once the program is complete, it should be bundled into a gem for distribution.
