ContactManager = new Marionette.Application()

# Declare our regions

ContactManager.addRegions
  mainRegion: "#main-region"

# Declare our models

ContactManager.Contact = Backbone.Model.extend({})

# Declare our views

ContactManager.StaticView = Marionette.ItemView.extend
  template: "#static-template"

ContactManager.ContactView = Marionette.ItemView.extend
  template: "#contact-template"

# Init

ContactManager.on "initialize:after", ->
  
  # Create a new contact and a view

  alice = new ContactManager.Contact
    firstName: "Alice"
    lastName: "Arten"
    phoneNumber: "555-0184"

  aliceView = new ContactManager.ContactView
    model: alice

  ContactManager.mainRegion.show aliceView

ContactManager.start()