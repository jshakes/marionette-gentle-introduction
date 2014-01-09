(function() {
  var ContactManager;

  ContactManager = new Marionette.Application();

  ContactManager.addRegions({
    mainRegion: "#main-region"
  });

  ContactManager.Contact = Backbone.Model.extend({});

  ContactManager.StaticView = Marionette.ItemView.extend({
    template: "#static-template"
  });

  ContactManager.ContactView = Marionette.ItemView.extend({
    template: "#contact-template"
  });

  ContactManager.on("initialize:after", function() {
    var alice, aliceView;
    alice = new ContactManager.Contact({
      firstName: "Alice",
      lastName: "Arten",
      phoneNumber: "555-0184"
    });
    aliceView = new ContactManager.ContactView({
      model: alice
    });
    return ContactManager.mainRegion.show(aliceView);
  });

  ContactManager.start();

}).call(this);
