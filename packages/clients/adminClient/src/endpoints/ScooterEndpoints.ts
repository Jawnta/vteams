export const enableScooter = async (id: number ) => {
    const requestOptions = {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
    };
    await fetch(`http://localhost:8080/scooters/enable/${id}`, requestOptions);
}

export const disableScooter = async (id: number ) => {
    const requestOptions = {
        method: "PUT",
        headers: {"Content-Type": "application/json"}
    };
    await fetch(`http://localhost:8080/scooters/disable/${id}`, requestOptions);
}
