"use strict";
exports.__esModule = true;
var scooter_1 = require("./scooter");
var node_fetch_1 = require("node-fetch");
function create() {
    var scooter = new scooter_1["default"](1, false, false, false, '000', 100, 30);
    scooter.sleep();
    return scooter;
}
function call(scooter) {
    var requestOptions = {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(scooter.get())
    };
    return (0, node_fetch_1["default"])("http://localhost:3000/scooters/".concat(scooter.getId()), requestOptions)
        .then(function (response) {
        if (!response.ok) {
            throw new Error(response.statusText);
        }
        return response.json();
    });
}
var scooter = create();
call(scooter).then(function (r) { return 'ignored'; });
