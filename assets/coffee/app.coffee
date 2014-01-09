ContactManager = new Marionette.Application()

# Declare our regions

ContactManager.addRegions
  mainRegion: "#main-region"


# Declare our views

ContactManager.StaticView = Marionette.ItemView.extend
  template: "#static-template"

ContactManager.ContactItemView = Marionette.ItemView.extend
  template: "#contact-list-item"
  tagName: "li"
  events:
    "click p": "alertPhoneNumber"

  alertPhoneNumber: ->
    alert @model.escape("phoneNumber")

ContactManager.ContactsView = Marionette.CollectionView.extend
  tagName: "ul"
  itemView: ContactManager.ContactItemView

# Init

ContactManager.on "initialize:after", ->

  # Create the contact data
  contactJSON = [
    {
      firstName: "Bob"
      lastName: "Brigham"
      phoneNumber: "555-0163"
    },
    {
      firstName: "Alice",
      lastName: "Arten",
      phoneNumber: "555-0184"
    },
    {
      firstName: "Charlie",
      lastName: "Campbell",
      phoneNumber: "555-0129"
    }
  ]

  # Create a collection with the data
  contacts = new ContactManager.Entities.ContactCollection contactJSON

  # Create a collection view to display this data
  contactsListView = new ContactManager.ContactsView
    collection: contacts

  # Show the collection view in the main region
  ContactManager.mainRegion.show contactsListView