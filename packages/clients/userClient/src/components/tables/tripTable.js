"use strict";
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
Object.defineProperty(exports, "__esModule", { value: true });
function TripTable(_a) {
    var props = __rest(_a, []);
    if (props.trips) {
        return (<table className="tripTable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Scooter id</th>
                        <th>Start</th>
                        <th>Stop</th>
                    
                    </tr>
                </thead>
                <tbody>
                {props.trips.map((trip) => {
                return (<tr key={trip.id} className="tripTable-row">
                               <td>{trip.id}</td>
                               <td>{trip.scooter_id}</td>
                               <td>{trip.start_time}</td>
                               <td>{trip.stop_time}</td>
                            </tr>);
            })}
                </tbody>
            </table>);
    }
    return (<div>
            <p>Loading...</p>
        </div>);
}
exports.default = TripTable;
