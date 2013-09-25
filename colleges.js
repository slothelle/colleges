Datum = new Meteor.Collection("data");
States = new Meteor.Collection("states");

if (Meteor.isClient) {
  Template.hello.greeting = function () {
    return "Welcome to colleges.";
  };

  Template.list.stateName = function() {
    return States.find().fetch();
  };

  Template.list.events({
    'click a' : function(event) {
      var getState = $(this).attr('state');
      event.preventDefault();
    }
  });

  Meteor.subscribe("datum");
  Meteor.subscribe("states");

  return Datum.find().fetch();
  return States.find().fetch();
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    Meteor.publish("datum", function() {
      return Datum.find();
    });

    Meteor.publish("states", function() {
      return States.find();
    });

    Datum.allow({
      insert: function () {
        return false;
      }
    });

    States.allow({
      insert: function () {
        return false;
      }
    });
  });
}
