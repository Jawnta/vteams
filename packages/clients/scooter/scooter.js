"use strict";
exports.__esModule = true;
var Scooter = /** @class */ (function () {
    /*    protected currentUser: number | null;*/
    function Scooter(id, enabled, available, inMaintenance, position, speed, charge) {
        this.id = id;
        this.enabled = enabled;
        this.available = available;
        this.inMaintenance = inMaintenance;
        this.position = position;
        this.speed = speed;
        this.charge = charge;
    }
    Scooter.prototype.get = function () {
        return {
            id: this.getId(),
            enabled: this.getEnabled(),
            available: this.getAvailable(),
            inMaintenance: this.getInMaintenance(),
            position: this.getPosition(),
            speed: this.getSpeed(),
            charge: this.getCharge()
        };
    };
    Scooter.prototype.getId = function () {
        return this.id;
    };
    Scooter.prototype.setId = function (id) {
        this.id = id;
    };
    Scooter.prototype.getEnabled = function () {
        return this.enabled;
    };
    Scooter.prototype.setEnabled = function (enabled) {
        this.enabled = enabled;
    };
    Scooter.prototype.getAvailable = function () {
        return this.enabled && this.available;
    };
    Scooter.prototype.setAvailable = function (available) {
        this.available = available;
    };
    Scooter.prototype.getInMaintenance = function () {
        return this.inMaintenance;
    };
    Scooter.prototype.setInMaintenance = function (inMaintenance) {
        this.inMaintenance = inMaintenance;
    };
    Scooter.prototype.getPosition = function () {
        return this.position;
    };
    Scooter.prototype.setPosition = function (position) {
        this.position = position;
    };
    Scooter.prototype.getSpeed = function () {
        return this.speed;
    };
    Scooter.prototype.setSpeed = function (speed) {
        this.speed = speed;
    };
    Scooter.prototype.getCharge = function () {
        return this.charge;
    };
    Scooter.prototype.setCharge = function (charge) {
        this.charge = charge;
    };
    Scooter.prototype.isRunning = function () {
        return this.getSpeed() > 0;
    };
    Scooter.prototype.sendReport = function () {
        // SEND DATA TO API
        return;
    };
    Scooter.prototype.assign = function (userId) {
        if (this.getAvailable()) {
            this.setAvailable(false);
            this.run();
            // return success
        }
        // return error
    };
    Scooter.prototype.deallocate = function () {
        // if parking zone okay
        this.sleep();
    };
    Scooter.prototype.run = function () {
        var _this = this;
        this.setCharge(this.getCharge() - 0.1);
        this.sendReport();
        setTimeout(function () { return _this.run(); }, 2000);
    };
    Scooter.prototype.sleep = function () {
        var _this = this;
        if (!this.isRunning()) {
            this.setCharge(this.getCharge() - 0.1);
            this.sendReport();
            setTimeout(function () { return _this.sleep(); }, 60000);
        }
        this.run();
    };
    Scooter.prototype.getSelf = function () {
        // api call
        // setEnabled(apicall.enabled)
    };
    return Scooter;
}());
exports["default"] = Scooter;
// GET scooters from database
// for scooter in db:
//      scoot = new Scooter(scooter.id, scooter.position);
//      scoot.sleep();
