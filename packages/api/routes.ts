module.exports = function (app: { use: (arg0: string, arg1: any) => void }) {
  /*
   * Routes
   */
  app.use("/chargingstations", require("./routes/chargingstations.route"));
  app.use("/chargingzones", require("./routes/chargingzones.route"));
  app.use("/cities", require("./routes/cities.route"));
  app.use("/invoices", require("./routes/invoices.route"));
  app.use("/parkingzones", require("./routes/parkingzones.route"));
  app.use("/scooters", require("./routes/scooters.route"));
  app.use("/trips", require("./routes/trips.route"));
  app.use("/users", require("./routes/users.route"));
};
