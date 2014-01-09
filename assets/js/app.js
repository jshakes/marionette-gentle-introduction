(function() {
  var ContactManager;

  ContactManager = new Marionette.Application();

  ContactManager.addRegions({
    mainRegion: "#main-region"
  });

  ContactManager.Contact = Backbone.Model.extend({
    defaults: {
      firstName: "",
      lastName: ""
    }
  });

  ContactManager.StaticView = Marionette.ItemView.extend({
    template: "#static-template"
  });

  ContactManager.ContactItemView = Marionette.ItemView.extend({
    template: "#contact-list-item",
    tagName: "li",
    events: {
      "click p": "alertPhoneNumber"
    },
    alertPhoneNumber: function() {
      return alert(this.model.escape("phoneNumber"));
    }
  });

  ContactManager.ContactsView = Marionette.CollectionView.extend({
    tagName: "ul",
    itemView: ContactManager.ContactItemView
  });

  ContactManager.ContactCollection = Backbone.Collection.extend({
    model: ContactManager.Contact
  });

  ContactManager.on("initialize:after", function() {
    var contactJSON, contacts, contactsListView;
    contactJSON = [
      {
        firstName: "Bob",
        lastName: "Brigham",
        phoneNumber: "555-0163"
      }, {
        firstName: "Alice",
        lastName: "Arten",
        phoneNumber: "555-0184"
      }, {
        firstName: "Charlie",
        lastName: "Campbell",
        phoneNumber: "555-0129"
      }
    ];
    contacts = new ContactManager.ContactCollection(contactJSON);
    contactsListView = new ContactManager.ContactsView({
      collection: contacts
    });
    return ContactManager.mainRegion.show(contactsListView);
  });

  ContactManager.start();

}).call(this);
