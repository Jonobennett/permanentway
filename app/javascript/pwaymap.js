const transport = L.tileLayer('https://api.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=ff72333a30dd47c8911006adaa025bb4', {
    maxZoom: 19,
    attribution: 'Maps &copy; <a href="https://www.thunderforest.com/">Thunderforest</a>, Data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
});

const osm = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
});

const baseMaps = {
    "Transport map": transport,
    "OpenStreetMap": osm
};

const PwayIcon = L.Icon.extend({
    options: {
        iconSize: [20, 33],
        iconAnchor: [10, 33],
        popupAnchor: [-3, -76]
    }
});

const unvisitedIcon = new PwayIcon({
    iconUrl: RAILS_ASSET_URL("/grey-br-icon.png")
});

const passedIcon = new PwayIcon({
    iconUrl: RAILS_ASSET_URL("/yellow-br-icon.png")
});

const calledAtIcon = new PwayIcon({
    iconUrl: RAILS_ASSET_URL("/orange-br-icon.png")
});

const changedIcon = new PwayIcon({
    iconUrl: RAILS_ASSET_URL("/blue-br-icon.png")
});

const gatelineIcon = new PwayIcon({
    iconUrl: RAILS_ASSET_URL("/green-br-icon.png")
});

const passed_through = L.layerGroup();
const called_at = L.layerGroup();
const changed = L.layerGroup();
const gateline = L.layerGroup();

const overlayMaps = {
    "Passed through": passed_through,
    "Called at": called_at,
    "Changed trains": changed,
    "Started/ended journey": gateline
}; 

const PwayMap = L.Map.extend({
    options: {
        center: [54.00,-2.55],
        zoom: 5,
        minZoom: 5,
        maxBounds: [
            [49.9, -6.0],
            [58.7, 1.85]
        ],
        layers: [transport, gateline]
    }
})