export default function generateUrl (start: string, end: string) {
    const api_key = "5b3ce3597851110001cf6248befe5764c3e64596870d529a1c8aa06e";
    // Lon, Lat for coordinates.
    return `https://api.openrouteservice.org/v2/directions/cycling-electric?api_key=${api_key}&start=${start}&end=${end}`;
}
